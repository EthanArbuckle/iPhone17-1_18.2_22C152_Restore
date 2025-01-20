@interface CDMSpanMatchUtils
+ (BOOL)isSamePosition:(id)a3 spanB:(id)a4 asrMapA:(id)a5 asrMapB:(id)a6 cdmTokenChainA:(id)a7 cdmTokenChainB:(id)a8;
+ (BOOL)isSpanOnlyForExternalParsers:(id)a3;
+ (BOOL)matcherNameIsSupportedForAsrAlternative:(id)a3;
+ (double)calculateAsrConfidenceForCharIndexBegin:(int64_t)a3 charIndexEnd:(int64_t)a4 asrTimingMap:(id)a5 asrHypothesis:(id)a6;
+ (id)createAsrAlternativeIdentifier:(id)a3 nameSpace:(id)a4 nodeIndex:(unsigned int)a5 backingAppBundleId:(id)a6 sourceComponent:(int)a7 asrConfidence:(double)a8;
+ (void)addAsrConfidenceToSpans:(id)a3 tokenChain:(id)a4 asrTimingMap:(id)a5 asrHypothesis:(id)a6;
+ (void)addEntitySpansFrom:(id)a3 to:(id)a4 confidence:(double)a5;
+ (void)mergeAsrAlternativeIntoSpan:(id)a3 asrAltSpan:(id)a4 asrAltCdmTokenChain:(id)a5 asrAltHypothesis:(id)a6 asrAltTimingMap:(id)a7;
+ (void)postProcessSpans:(id)a3 asrSpansMap:(id)a4 asrHypothesis:(id)a5 asrMaps:(id)a6 topAsrTokenChain:(id)a7 asrMapTopAsr:(id)a8 topAsrSpansFiltered:(id)a9;
+ (void)processAsrAlternative:(id)a3 topAsrTokenChain:(id)a4 cdmTokenChainAltAsr:(id)a5 asrMapTopAsr:(id)a6 asrMapAltAsr:(id)a7 spansTopAsr:(id)a8 asrHypothesis:(id)a9;
+ (void)setAsrHypothesisIndexForTopAsrSpans:(id)a3;
@end

@implementation CDMSpanMatchUtils

+ (void)postProcessSpans:(id)a3 asrSpansMap:(id)a4 asrHypothesis:(id)a5 asrMaps:(id)a6 topAsrTokenChain:(id)a7 asrMapTopAsr:(id)a8 topAsrSpansFiltered:(id)a9
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v48 = a4;
  id v15 = a5;
  id v47 = a6;
  id v46 = a7;
  id v45 = a8;
  id v16 = a9;
  if ((unint64_t)[v14 count] > 1)
  {
    uint64_t v19 = [v14 count];
    uint64_t v20 = [v15 count];
    v17 = CDMOSLoggerForCategory(0);
    BOOL v21 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v19 == v20)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAs"
              "rSpansFiltered:]";
        _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Processing ASR alternatives 2..n", buf, 0xCu);
      }

      os_signpost_id_t v22 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v23 = (id)CDMLogContext;
      v24 = v23;
      unint64_t v43 = v22 - 1;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SpanMatcher", "Post-process ASR alternative(s)", buf, 2u);
      }
      os_signpost_id_t spid = v22;

      v44 = [MEMORY[0x263EFF910] date];
      if ((unint64_t)[v14 count] >= 2)
      {
        uint64_t v25 = 1;
        do
        {
          v26 = [v14 objectAtIndexedSubscript:v25];
          v27 = [CDMTokenChain alloc];
          v28 = [v26 tokenChain];
          v29 = [(CDMTokenChain *)v27 initWithProtoTokenChain:v28];

          v30 = [v26 asrId];
          v31 = [v47 objectForKey:v30];

          v32 = [v26 asrId];
          v33 = [v48 objectForKey:v32];

          v34 = CDMOSLoggerForCategory(0);
          unint64_t v35 = v25 + 1;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:t"
                  "opAsrSpansFiltered:]";
            __int16 v51 = 1024;
            LODWORD(v52) = v25 + 1;
            _os_log_debug_impl(&dword_2263A0000, v34, OS_LOG_TYPE_DEBUG, "%s Processing spans from ASR alt #%d", buf, 0x12u);
          }

          v36 = [v15 objectAtIndexedSubscript:v25];
          +[CDMSpanMatchUtils processAsrAlternative:topAsrTokenChain:cdmTokenChainAltAsr:asrMapTopAsr:asrMapAltAsr:spansTopAsr:asrHypothesis:](CDMSpanMatchUtils, "processAsrAlternative:topAsrTokenChain:cdmTokenChainAltAsr:asrMapTopAsr:asrMapAltAsr:spansTopAsr:asrHypothesis:", v33, v46, v29, v45, v31, v16, v36, spid);

          uint64_t v25 = v35;
        }
        while ([v14 count] > v35);
      }
      v17 = v44;
      [v44 timeIntervalSinceNow];
      double v38 = v37;
      v39 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAs"
              "rSpansFiltered:]";
        __int16 v51 = 2048;
        double v52 = -v38;
        _os_log_debug_impl(&dword_2263A0000, v39, OS_LOG_TYPE_DEBUG, "%s Done post-processing ASR alternatives, took %f sec", buf, 0x16u);
      }

      v40 = (id)CDMLogContext;
      v41 = v40;
      if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v41, OS_SIGNPOST_INTERVAL_END, spid, "SpanMatcher", "", buf, 2u);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAsrSpansFiltered:]";
      v18 = "%s Span match requests and ASR hypothesis counts are not equal, skipping span matching for ASR alternatives";
      goto LABEL_18;
    }
  }
  else
  {
    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAsrSpansFiltered:]";
      v18 = "%s Moving on as there are no ASR alternatives to process";
LABEL_18:
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
    }
  }
}

+ (void)processAsrAlternative:(id)a3 topAsrTokenChain:(id)a4 cdmTokenChainAltAsr:(id)a5 asrMapTopAsr:(id)a6 asrMapAltAsr:(id)a7 spansTopAsr:(id)a8 asrHypothesis:(id)a9
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v46 = a4;
  id v48 = a5;
  id v45 = a6;
  id v47 = a7;
  id v41 = a8;
  id v44 = a9;
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v16 = (id)CDMLogContext;
  v17 = v16;
  unint64_t v38 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SpanMatcher", "Post-process one ASR alternative", buf, 2u);
  }
  os_signpost_id_t spid = v15;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v14;
  uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v55;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v55 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v18;
        uint64_t v19 = *(void **)(*((void *)&v54 + 1) + 8 * v18);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v49 = v41;
        uint64_t v20 = [v49 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v51;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v51 != v22) {
                objc_enumerationMutation(v49);
              }
              v24 = *(void **)(*((void *)&v50 + 1) + 8 * v23);
              uint64_t v25 = [v19 label];
              v26 = [v24 label];
              if (([v25 isEqualToString:v26] & 1) == 0) {
                goto LABEL_17;
              }
              v27 = [v19 input];
              v28 = [v24 input];
              if ([v27 isEqualToString:v28])
              {

LABEL_17:
                goto LABEL_18;
              }
              BOOL v29 = +[CDMSpanMatchUtils isSamePosition:v24 spanB:v19 asrMapA:v45 asrMapB:v47 cdmTokenChainA:v46 cdmTokenChainB:v48];

              if (v29)
              {
                v30 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  v31 = [v24 input];
                  v32 = [v19 input];
                  v33 = [v19 label];
                  *(_DWORD *)buf = 136315906;
                  v59 = "+[CDMSpanMatchUtils processAsrAlternative:topAsrTokenChain:cdmTokenChainAltAsr:asrMapTopAsr:asrM"
                        "apAltAsr:spansTopAsr:asrHypothesis:]";
                  __int16 v60 = 2112;
                  v61 = v31;
                  __int16 v62 = 2112;
                  v63 = v32;
                  __int16 v64 = 2112;
                  v65 = v33;
                  _os_log_debug_impl(&dword_2263A0000, v30, OS_LOG_TYPE_DEBUG, "%s Updating UsoEntityIdentifier as these 2 spans have 1) Same spanLabel 2) Different input value 3) AND are considered the same per ASR timing info. spanTopAsr=[%@], spanAltAsr=[%@], label=[%@]", buf, 0x2Au);
                }
                +[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:v24 asrAltSpan:v19 asrAltCdmTokenChain:v48 asrAltHypothesis:v44 asrAltTimingMap:v47];
              }
LABEL_18:
              ++v23;
            }
            while (v21 != v23);
            uint64_t v34 = [v49 countByEnumeratingWithState:&v50 objects:v66 count:16];
            uint64_t v21 = v34;
          }
          while (v34);
        }

        uint64_t v18 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v42);
  }

  unint64_t v35 = (id)CDMLogContext;
  v36 = v35;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v36, OS_SIGNPOST_INTERVAL_END, spid, "SpanMatcher", "", buf, 2u);
  }
}

+ (void)setAsrHypothesisIndexForTopAsrSpans:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v8 hasUsoGraph])
        {
          v9 = [v8 usoGraph];
          v10 = [v9 alignments];

          if (v10)
          {
            long long v19 = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            v11 = objc_msgSend(v8, "usoGraph", 0);
            v12 = [v11 alignments];

            uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v18;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v18 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  [*(id *)(*((void *)&v17 + 1) + 8 * j) setAsrHypothesisIndex:0];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
              }
              while (v14);
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
}

+ (BOOL)isSpanOnlyForExternalParsers:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 hasUsoGraph])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    double v37 = v3;
    uint64_t v4 = [v3 usoGraph];
    uint64_t v5 = [v4 identifiers];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v48;
      uint64_t v9 = *MEMORY[0x263F738A8];
      uint64_t v10 = *MEMORY[0x263F73820];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v13 = [v12 value];
          if ([v13 isEqualToString:v9])
          {
            uint64_t v14 = [v12 namespaceA];
            uint64_t v15 = [v14 value];
            char v16 = [v15 isEqualToString:v10];

            if (v16)
            {
LABEL_36:
              BOOL v32 = 1;
              goto LABEL_37;
            }
          }
          else
          {
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    if (+[CDMFeatureFlags isUsoEntitySpanEnabled])
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v17 = [v37 usoGraph];
      uint64_t v5 = [v17 spans];

      uint64_t v35 = [v5 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v35)
      {
        uint64_t v18 = *(void *)v44;
        uint64_t v19 = *MEMORY[0x263F738A8];
        uint64_t v38 = *MEMORY[0x263F73820];
        uint64_t v34 = *(void *)v44;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v5);
            }
            uint64_t v36 = v20;
            long long v21 = *(void **)(*((void *)&v43 + 1) + 8 * v20);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v22 = [v21 properties];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v40;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v40 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                  if ([v27 hasValueString])
                  {
                    v28 = [v27 valueString];
                    BOOL v29 = [v28 value];
                    if ([v29 isEqualToString:v19])
                    {
                      v30 = [v27 key];
                      char v31 = [v30 isEqualToString:v38];

                      if (v31)
                      {

                        goto LABEL_36;
                      }
                    }
                    else
                    {
                    }
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
              }
              while (v24);
            }

            uint64_t v20 = v36 + 1;
            uint64_t v18 = v34;
          }
          while (v36 + 1 != v35);
          uint64_t v35 = [v5 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v35);
      }
      BOOL v32 = 0;
LABEL_37:
    }
    else
    {
      BOOL v32 = 0;
    }
    id v3 = v37;
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

+ (void)addEntitySpansFrom:(id)a3 to:(id)a4 confidence:(double)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [v7 usoGraph];
  uint64_t v10 = [v9 spans];

  v11 = v10;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v28;
    *(void *)&long long v13 = 136315394;
    long long v26 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "copy", v26);
        id v20 = objc_alloc_init(MEMORY[0x263F71C98]);
        long long v21 = [v7 input];
        [v20 setAlternative:v21];

        if (a5 != -1.0)
        {
          id v22 = objc_alloc_init(MEMORY[0x263F71C78]);
          float v16 = a5;
          *(float *)&double v23 = v16;
          [v22 setValue:v23];
          [v20 setProbability:v22];
        }
        [v19 addAlternatives:v20];
        uint64_t v24 = [v8 usoGraph];
        [v24 addSpans:v19];

        uint64_t v25 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          BOOL v32 = "+[CDMSpanMatchUtils addEntitySpansFrom:to:confidence:]";
          __int16 v33 = 2112;
          uint64_t v34 = v18;
          _os_log_debug_impl(&dword_2263A0000, v25, OS_LOG_TYPE_DEBUG, "%s Copied to spanDest (i.e. top ASR's span), usoEntitySpan:%@", buf, 0x16u);
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v14);
  }
}

+ (void)mergeAsrAlternativeIntoSpan:(id)a3 asrAltSpan:(id)a4 asrAltCdmTokenChain:(id)a5 asrAltHypothesis:(id)a6 asrAltTimingMap:(id)a7
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v12 = a3;
  long long v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (([v13 hasUsoGraph] & 1) == 0)
  {
    uint64_t v25 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315394;
    v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
    __int16 v70 = 2112;
    v71 = v13;
    long long v26 = "%s [WARN]: Did not expect asrAltSpan without USO graph. asrAltSpan=%@";
LABEL_17:
    _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, v26, buf, 0x16u);
    goto LABEL_41;
  }
  if (([v12 hasUsoGraph] & 1) == 0)
  {
    uint64_t v25 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315394;
    v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
    __int16 v70 = 2112;
    v71 = v12;
    long long v26 = "%s [WARN]: Did not expect spanDest without USO graph. spanDest=%@";
    goto LABEL_17;
  }
  id v59 = v16;
  id v56 = v15;
  long long v57 = v14;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v17 = [v12 usoGraph];
  uint64_t v18 = [v17 identifiers];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    unsigned int v21 = 0;
    uint64_t v22 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v65 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if ([v24 groupIndex] > v21) {
          unsigned int v21 = [v24 groupIndex];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v20);
  }
  else
  {
    unsigned int v21 = 0;
  }
  id v55 = a1;

  uint64_t v27 = v21 + 1;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v58 = v13;
  long long v28 = [v13 usoGraph];
  long long v29 = [v28 identifiers];

  uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v74 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v25 = 0;
    uint64_t v32 = *(void *)v61;
    do
    {
      uint64_t v33 = 0;
      uint64_t v34 = v25;
      do
      {
        if (*(void *)v61 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(NSObject **)(*((void *)&v60 + 1) + 8 * v33);
        [v35 setGroupIndex:v27];
        uint64_t v36 = [v12 usoGraph];
        [v36 addIdentifiers:v35];

        double v37 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
          __int16 v70 = 2112;
          v71 = v35;
          _os_log_debug_impl(&dword_2263A0000, v37, OS_LOG_TYPE_DEBUG, "%s Copied to spanDest (i.e. top ASR's span), identifier:%@", buf, 0x16u);
        }

        uint64_t v25 = v35;
        ++v33;
        uint64_t v34 = v25;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v31);
  }
  else
  {
    uint64_t v25 = 0;
  }

  id v14 = v57;
  uint64_t v38 = [v57 tokens];
  long long v13 = v58;
  long long v39 = objc_msgSend(v38, "objectAtIndexedSubscript:", -[NSObject startTokenIndex](v58, "startTokenIndex"));
  uint64_t v40 = [v39 begin];

  long long v41 = [v57 tokens];
  long long v42 = objc_msgSend(v41, "objectAtIndexedSubscript:", -[NSObject endTokenIndex](v58, "endTokenIndex") - 1);
  uint64_t v43 = [v42 end];

  long long v44 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    long long v53 = [v58 label];
    uint64_t v54 = [v58 input];
    *(_DWORD *)buf = 136315650;
    v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
    __int16 v70 = 2112;
    v71 = v53;
    __int16 v72 = 2112;
    v73 = v54;
    _os_log_debug_impl(&dword_2263A0000, v44, OS_LOG_TYPE_DEBUG, "%s Annotating ASR confidence on span label=%@, matchedText=%@", buf, 0x20u);

    long long v13 = v58;
  }

  id v15 = v56;
  id v16 = v59;
  [v55 calculateAsrConfidenceForCharIndexBegin:v40 charIndexEnd:v43 asrTimingMap:v59 asrHypothesis:v56];
  double v46 = v45;
  if (+[CDMFeatureFlags isUsoEntitySpanEnabled]) {
    [v55 addEntitySpansFrom:v13 to:v12 confidence:v46];
  }
  if (v46 == -1.0)
  {
    long long v47 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
      _os_log_debug_impl(&dword_2263A0000, v47, OS_LOG_TYPE_DEBUG, "%s ASR confidence is missing on one or more ASR tokens, not annotating the span", buf, 0xCu);
    }
  }
  else
  {
    long long v48 = [v13 input];
    uint64_t v49 = [v25 nodeIndex];
    long long v50 = [v25 backingAppBundleId];
    long long v47 = +[CDMSpanMatchUtils createAsrAlternativeIdentifier:v48 nameSpace:@"asr_alternative" nodeIndex:v49 backingAppBundleId:v50 sourceComponent:[v25 sourceComponent] asrConfidence:v46];

    [v47 setGroupIndex:v27];
    long long v51 = [v12 usoGraph];
    [v51 addIdentifiers:v47];

    long long v52 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "+[CDMSpanMatchUtils mergeAsrAlternativeIntoSpan:asrAltSpan:asrAltCdmTokenChain:asrAltHypothesis:asrAltTimingMap:]";
      __int16 v70 = 2112;
      v71 = v47;
      _os_log_debug_impl(&dword_2263A0000, v52, OS_LOG_TYPE_DEBUG, "%s Added an extra asr_alternative to spanDest (i.e. top ASR's span), asrAltIdentifier:%@", buf, 0x16u);
    }

    id v16 = v59;
  }

LABEL_41:
}

+ (id)createAsrAlternativeIdentifier:(id)a3 nameSpace:(id)a4 nodeIndex:(unsigned int)a5 backingAppBundleId:(id)a6 sourceComponent:(int)a7 asrConfidence:(double)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a5;
  long long v13 = (objc_class *)MEMORY[0x263F71D98];
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v13);
  id v18 = objc_alloc_init(MEMORY[0x263F71C88]);
  [v18 setValue:v15];

  [v17 setNamespaceA:v18];
  [v17 setValue:v16];

  [v17 setNodeIndex:v10];
  [v17 setBackingAppBundleId:v14];

  [v17 setSourceComponent:v9];
  id v19 = objc_alloc_init(MEMORY[0x263F71C70]);
  [v19 setValue:a8];
  [v17 setProbability:v19];

  return v17;
}

+ (void)addAsrConfidenceToSpans:(id)a3 tokenChain:(id)a4 asrTimingMap:(id)a5 asrHypothesis:(id)a6
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v61 = a5;
  id v60 = a6;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v73;
    id v58 = v12;
    id v59 = v11;
    id v57 = a1;
    uint64_t v64 = *(void *)v73;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v65 = v14;
      do
      {
        if (*(void *)v73 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v66 = v16;
        id v17 = *(void **)(*((void *)&v72 + 1) + 8 * v16);
        uint64_t v18 = *(unsigned int *)[v17 matcherNames];
        if (v18 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
          id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v19 = off_2647A5828[v18];
        }
        long long v67 = v19;
        if ([a1 matcherNameIsSupportedForAsrAlternative:v19])
        {
          if ([v17 hasUsoGraph])
          {
            uint64_t v20 = [v17 usoGraph];
            unsigned int v21 = [v20 identifiers];
            uint64_t v22 = [v21 count];

            uint64_t v14 = v65;
            uint64_t v15 = v64;
            if (v22)
            {
              double v23 = [v11 tokens];
              uint64_t v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v17, "startTokenIndex"));
              uint64_t v25 = [v24 begin];

              if ([v17 endTokenIndex])
              {
                long long v26 = [v11 tokens];
                uint64_t v27 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v17, "endTokenIndex") - 1);
                uint64_t v28 = [v27 end];

                long long v29 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  long long v63 = [v17 label];
                  uint64_t v54 = [v17 input];
                  *(_DWORD *)buf = 136315650;
                  v78 = "+[CDMSpanMatchUtils addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:]";
                  __int16 v79 = 2112;
                  v80 = v63;
                  __int16 v81 = 2112;
                  uint64_t v82 = v54;
                  id v55 = (void *)v54;
                  _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, "%s Annotating ASR confidence on span label=%@, matchedText=%@", buf, 0x20u);
                }
                [a1 calculateAsrConfidenceForCharIndexBegin:v25 charIndexEnd:v28 asrTimingMap:v61 asrHypothesis:v60];
                if (v30 == -1.0)
                {
                  id v56 = CDMOSLoggerForCategory(0);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315138;
                    v78 = "+[CDMSpanMatchUtils addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:]";
                    _os_log_debug_impl(&dword_2263A0000, v56, OS_LOG_TYPE_DEBUG, "%s ASR confidence is missing on one or more ASR tokens, not annotating the span", buf, 0xCu);
                  }

                  goto LABEL_36;
                }
                double v31 = v30;
                uint64_t v32 = [v17 usoGraph];
                uint64_t v33 = [v32 identifiers];
                uint64_t v34 = [v33 objectAtIndexedSubscript:0];

                uint64_t v35 = [v17 usoGraph];
                uint64_t v36 = [v35 identifiers];
                double v37 = [v17 input];
                uint64_t v38 = [v34 nodeIndex];
                long long v39 = [v34 backingAppBundleId];
                long long v62 = v34;
                uint64_t v40 = +[CDMSpanMatchUtils createAsrAlternativeIdentifier:v37 nameSpace:@"asr_alternative" nodeIndex:v38 backingAppBundleId:v39 sourceComponent:[v34 sourceComponent] asrConfidence:v31];
                [v36 addObject:v40];

                if (+[CDMFeatureFlags isUsoEntitySpanEnabled])
                {
                  long long v70 = 0u;
                  long long v71 = 0u;
                  long long v68 = 0u;
                  long long v69 = 0u;
                  long long v41 = [v17 usoGraph];
                  long long v42 = [v41 spans];

                  uint64_t v43 = [v42 countByEnumeratingWithState:&v68 objects:v76 count:16];
                  if (v43)
                  {
                    uint64_t v44 = v43;
                    uint64_t v45 = *(void *)v69;
                    float v46 = v31;
                    do
                    {
                      for (uint64_t i = 0; i != v44; ++i)
                      {
                        if (*(void *)v69 != v45) {
                          objc_enumerationMutation(v42);
                        }
                        long long v48 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                        id v49 = objc_alloc_init(MEMORY[0x263F71C98]);
                        long long v50 = [v17 input];
                        [v49 setAlternative:v50];

                        id v51 = objc_alloc_init(MEMORY[0x263F71C78]);
                        *(float *)&double v52 = v46;
                        [v51 setValue:v52];
                        [v49 setProbability:v51];

                        [v48 addAlternatives:v49];
                      }
                      uint64_t v44 = [v42 countByEnumeratingWithState:&v68 objects:v76 count:16];
                    }
                    while (v44);
                  }

                  id v12 = v58;
                  id v11 = v59;
                  a1 = v57;
                  uint64_t v15 = v64;
                  uint64_t v14 = v65;
                  long long v53 = v62;
                }
                else
                {
                  a1 = v57;
                  id v12 = v58;
                  uint64_t v15 = v64;
                  uint64_t v14 = v65;
                  long long v53 = v34;
                  id v11 = v59;
                }
              }
              else
              {
                long long v53 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v78 = "+[CDMSpanMatchUtils addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:]";
                  __int16 v79 = 2112;
                  v80 = v17;
                  _os_log_error_impl(&dword_2263A0000, v53, OS_LOG_TYPE_ERROR, "%s [ERR]: SpanMatchUtil end token index should not be smaller than 1. Offending span is %@", buf, 0x16u);
                }
                uint64_t v15 = v64;
                uint64_t v14 = v65;
              }
            }
          }
        }

        uint64_t v16 = v66 + 1;
      }
      while (v66 + 1 != v14);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_36:
}

+ (BOOL)matcherNameIsSupportedForAsrAlternative:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SIRI_VOCABULARY_MATCHER"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"VOC_TRIE_MATCHER"];
  }

  return v4;
}

+ (double)calculateAsrConfidenceForCharIndexBegin:(int64_t)a3 charIndexEnd:(int64_t)a4 asrTimingMap:(id)a5 asrHypothesis:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if ([v10 asrTokensCount])
  {
    id v11 = [NSNumber numberWithInteger:a3];
    id v12 = [v9 objectForKey:v11];

    uint64_t v13 = [NSNumber numberWithInteger:a4];
    uint64_t v14 = [v9 objectForKey:v13];

    double v15 = 0.0;
    if (v12 && v14)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v16 = [v10 asrTokens];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
      double v15 = -1.0;
      if (v17)
      {
        uint64_t v19 = v17;
        id v31 = v9;
        int v20 = 0;
        uint64_t v21 = *(void *)v33;
        double v22 = 0.0;
        *(void *)&long long v18 = 136315394;
        long long v30 = v18;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v16);
            }
            uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (!objc_msgSend(v24, "hasConfidenceScore", v30)) {
              goto LABEL_20;
            }
            int v25 = [v24 startMilliSeconds];
            if (v25 >= (int)[v12 intValue])
            {
              int v26 = [v24 endMilliSeconds];
              if (v26 > (int)[v14 intValue]) {
                goto LABEL_17;
              }
              uint64_t v27 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v30;
                double v37 = "+[CDMSpanMatchUtils calculateAsrConfidenceForCharIndexBegin:charIndexEnd:asrTimingMap:asrHypothesis:]";
                __int16 v38 = 2112;
                double v39 = *(double *)&v24;
                _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s Average ASR confidence calculation includes token=%@", buf, 0x16u);
              }

              [v24 confidenceScore];
              double v22 = v22 + v28;
              ++v20;
            }
          }
          uint64_t v19 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v19) {
            continue;
          }
          break;
        }
LABEL_17:

        if (v20)
        {
          uint64_t v16 = CDMOSLoggerForCategory(0);
          double v15 = v22 / (double)v20;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            double v37 = "+[CDMSpanMatchUtils calculateAsrConfidenceForCharIndexBegin:charIndexEnd:asrTimingMap:asrHypothesis:]";
            __int16 v38 = 2048;
            double v39 = v22 / (double)v20;
            _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Average ASR confidence is %f", buf, 0x16u);
          }
LABEL_20:
          id v9 = v31;
          goto LABEL_21;
        }
        double v15 = -1.0;
        id v9 = v31;
      }
      else
      {
LABEL_21:
      }
    }
  }
  else
  {
    double v15 = -1.0;
  }

  return v15;
}

+ (BOOL)isSamePosition:(id)a3 spanB:(id)a4 asrMapA:(id)a5 asrMapB:(id)a6 cdmTokenChainA:(id)a7 cdmTokenChainB:(id)a8
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  unsigned int v19 = [v13 startTokenIndex];
  int v20 = [v17 tokens];
  unint64_t v21 = [v20 count];

  if (v21 <= v19)
  {
    long long v42 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    int v52 = [v13 startTokenIndex];
    long long v53 = [v17 tokens];
    *(_DWORD *)buf = 136315650;
    uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
    __int16 v77 = 1024;
    *(_DWORD *)v78 = v52;
    *(_WORD *)&v78[4] = 2048;
    *(void *)&v78[6] = [v53 count];
    uint64_t v54 = "%s [WARN]: spanA.startTokenIndex=%u is out of range with tokens.count=%zd";
LABEL_24:
    _os_log_impl(&dword_2263A0000, v42, OS_LOG_TYPE_INFO, v54, buf, 0x1Cu);

    goto LABEL_28;
  }
  double v22 = [v17 tokens];
  double v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v13, "startTokenIndex"));
  uint64_t v24 = [v23 begin];

  unint64_t v25 = [v13 endTokenIndex] - 1;
  int v26 = [v17 tokens];
  unint64_t v27 = [v26 count];

  if (v27 <= v25)
  {
    long long v42 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      int v55 = [v13 endTokenIndex] - 1;
      id v56 = [v17 tokens];
      *(_DWORD *)buf = 136315650;
      uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v55;
      *(_WORD *)&v78[4] = 2048;
      *(void *)&v78[6] = [v56 count];
      id v57 = "%s [WARN]: (spanA.endTokenIndex - 1)=%u is out of range with tokens.count=%zd";
LABEL_27:
      _os_log_impl(&dword_2263A0000, v42, OS_LOG_TYPE_INFO, v57, buf, 0x1Cu);
    }
LABEL_28:
    BOOL v51 = 0;
    goto LABEL_29;
  }
  double v28 = [v17 tokens];
  long long v29 = objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v13, "endTokenIndex") - 1);
  uint64_t v73 = [v29 end];

  LODWORD(v28) = [v14 startTokenIndex];
  long long v30 = [v18 tokens];
  unint64_t v31 = [v30 count];

  if (v31 <= v28)
  {
    long long v42 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    int v58 = [v14 startTokenIndex];
    long long v53 = [v18 tokens];
    *(_DWORD *)buf = 136315650;
    uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
    __int16 v77 = 1024;
    *(_DWORD *)v78 = v58;
    *(_WORD *)&v78[4] = 2048;
    *(void *)&v78[6] = [v53 count];
    uint64_t v54 = "%s [WARN]: spanB.startTokenIndex=%u is out of range with tokens.count=%zd";
    goto LABEL_24;
  }
  long long v32 = [v18 tokens];
  long long v33 = objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(v14, "startTokenIndex"));
  uint64_t v71 = [v33 begin];

  unint64_t v34 = [v14 endTokenIndex] - 1;
  long long v35 = [v18 tokens];
  unint64_t v36 = [v35 count];

  if (v36 <= v34)
  {
    long long v42 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      int v59 = [v14 endTokenIndex] - 1;
      id v56 = [v18 tokens];
      *(_DWORD *)buf = 136315650;
      uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v59;
      *(_WORD *)&v78[4] = 2048;
      *(void *)&v78[6] = [v56 count];
      id v57 = "%s [WARN]: (spanB.endTokenIndex - 1)=%u is out of range with tokens.count=%zd";
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  double v37 = [v18 tokens];
  __int16 v38 = objc_msgSend(v37, "objectAtIndexedSubscript:", objc_msgSend(v14, "endTokenIndex") - 1);
  uint64_t v39 = [v38 end];

  uint64_t v40 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
    __int16 v77 = 2048;
    *(void *)v78 = v24;
    *(_WORD *)&v78[8] = 2048;
    *(void *)&v78[10] = v73;
    __int16 v79 = 2048;
    uint64_t v80 = v71;
    __int16 v81 = 2048;
    uint64_t v82 = v39;
    __int16 v83 = 2112;
    id v84 = v15;
    __int16 v85 = 2112;
    id v86 = v16;
    _os_log_debug_impl(&dword_2263A0000, v40, OS_LOG_TYPE_DEBUG, "%s Used span's start/end token index + CDMTokenChain's indices to find the ASR character indices. spanACharIndexBegin=%ld, spanACharIndexEnd=%ld, spanBCharIndexBegin=%ld, spanBCharIndexEnd=%ld, asrMapA=%@, asrMapB=%@", buf, 0x48u);
  }

  uint64_t v41 = [NSNumber numberWithInteger:v24];
  long long v42 = [v15 objectForKey:v41];

  if (!v42) {
    goto LABEL_28;
  }
  uint64_t v43 = [NSNumber numberWithInteger:v73];
  uint64_t v44 = [v15 objectForKey:v43];

  if (v44)
  {
    long long v69 = v44;
    uint64_t v45 = [NSNumber numberWithInteger:v71];
    uint64_t v46 = [v16 objectForKey:v45];

    long long v74 = (void *)v46;
    if (v46)
    {
      long long v47 = [NSNumber numberWithInteger:v39];
      uint64_t v48 = [v16 objectForKey:v47];

      long long v72 = (void *)v48;
      if (v48)
      {
        id v49 = CDMOSLoggerForCategory(0);
        long long v50 = v74;
        uint64_t v44 = v69;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
          __int16 v77 = 2112;
          *(void *)v78 = v42;
          *(_WORD *)&v78[8] = 2112;
          *(void *)&v78[10] = v69;
          __int16 v79 = 2112;
          uint64_t v80 = (uint64_t)v74;
          __int16 v81 = 2112;
          uint64_t v82 = (uint64_t)v72;
          _os_log_debug_impl(&dword_2263A0000, v49, OS_LOG_TYPE_DEBUG, "%s Found spanAAsrTimingBegin=%@, spanAAsrTimingEnd=%@, spanBAsrTimingBegin=%@, spanBAsrTimingEnd=%@", buf, 0x34u);
        }

        if ([v42 isEqualToNumber:v74]
          && [v69 isEqualToNumber:v72])
        {
          log = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            long long v68 = [v13 input];
            uint64_t v66 = [v14 input];
            uint64_t v63 = [v14 label];
            *(_DWORD *)buf = 136316418;
            uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
            __int16 v77 = 2112;
            *(void *)v78 = v68;
            *(_WORD *)&v78[8] = 2112;
            *(void *)&v78[10] = v66;
            __int16 v79 = 2112;
            uint64_t v80 = v63;
            uint64_t v64 = (void *)v63;
            __int16 v81 = 2112;
            uint64_t v82 = (uint64_t)v42;
            __int16 v83 = 2112;
            id v84 = v69;
            _os_log_debug_impl(&dword_2263A0000, log, OS_LOG_TYPE_DEBUG, "%s These 2 spans are considered the same per ASR timing info. spanTopAsr=[%@], spanAltAsr=[%@], label=[%@], asrTiming{Begin/End}=%@/%@", buf, 0x3Eu);
          }
          BOOL v51 = 1;
        }
        else
        {
          log = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            long long v67 = [v13 input];
            uint64_t v65 = [v14 input];
            uint64_t v61 = [v14 label];
            *(_DWORD *)buf = 136316930;
            uint64_t v76 = "+[CDMSpanMatchUtils isSamePosition:spanB:asrMapA:asrMapB:cdmTokenChainA:cdmTokenChainB:]";
            __int16 v77 = 2112;
            *(void *)v78 = v67;
            *(_WORD *)&v78[8] = 2112;
            *(void *)&v78[10] = v65;
            __int16 v79 = 2112;
            uint64_t v80 = v61;
            long long v62 = (void *)v61;
            __int16 v81 = 2112;
            uint64_t v82 = (uint64_t)v42;
            __int16 v83 = 2112;
            id v84 = v69;
            __int16 v85 = 2112;
            id v86 = v74;
            __int16 v87 = 2112;
            v88 = v72;
            _os_log_debug_impl(&dword_2263A0000, log, OS_LOG_TYPE_DEBUG, "%s These 2 spans are NOT considered the same per ASR timing info. spanTopAsr=[%@], spanAltAsr=[%@], label=[%@], spanAAsrTiming{Begin/End}=%@/%@, spanBAsrTiming{Begin/End}=%@/%@", buf, 0x52u);
          }
          BOOL v51 = 0;
        }
      }
      else
      {
        BOOL v51 = 0;
        long long v50 = v74;
        uint64_t v44 = v69;
      }
    }
    else
    {
      BOOL v51 = 0;
      long long v50 = 0;
      uint64_t v44 = v69;
    }
  }
  else
  {
    BOOL v51 = 0;
  }

LABEL_29:
  return v51;
}

@end