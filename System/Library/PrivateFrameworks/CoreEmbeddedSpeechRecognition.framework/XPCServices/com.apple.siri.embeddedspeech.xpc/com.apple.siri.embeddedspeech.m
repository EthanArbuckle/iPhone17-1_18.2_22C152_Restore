int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  ESListenerDelegate *v7;
  void *v8;

  signal(15, (void (__cdecl *)(int))1);
  unsetenv("TMPDIR");
  v4 = NSTemporaryDirectory();
  v5 = dispatch_get_global_queue(21, 0);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v5);

  if (v6)
  {
    dispatch_source_set_event_handler(v6, &stru_100051610);
    dispatch_resume(v6);
  }
  sub_10000F4F0();
  +[ESConnection captureESStartTimeInTicks];
  +[ESSelfHelper initializeSharedPowerLoggerIfNeeded];
  +[ESSelfHelper logPowerSnapshotForProcessStarted];
  +[NSXPCListener enableTransactions];
  v7 = objc_alloc_init(ESListenerDelegate);
  v8 = +[NSXPCListener serviceListener];
  [v8 setDelegate:v7];
  [v8 resume];
  +[ESSelfHelper logPowerSnapshotForProcessEnded];
  exit(1);
}

void sub_100005B48(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "-[ESSelfHelper logPersonalizationExperimentTriggersForExperimentIds:]_block_invoke";
      __int16 v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s SELF: Failed trying to emit trigger logging due to error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_1000070C4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  if (a2 == 1)
  {
    id v30 = objc_begin_catch(a1);
    v31 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v29 - 144) = 136315394;
      uint64_t v32 = v29 - 144;
      *(void *)(v32 + 4) = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActi"
                             "veTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognition"
                             "DurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEna"
                             "bled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDuratio"
                             "nInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:"
                             "recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSeco"
                             "ndaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      *(_WORD *)(v29 - 132) = 2112;
      *(void *)(v32 + 14) = a29;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recognizer. String: %@", (uint8_t *)(v29 - 144), 0x16u);
      v31 = AFSiriLogContextSpeech;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v29 - 144) = 136315138;
      *(void *)(v29 - 140) = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageAc"
                               "tiveTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recogni"
                               "tionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenat"
                               "ionEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:it"
                               "nDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotR"
                               "ecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationIn"
                               "Ns:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s SELF: Expected interpolation weight sets separated by delimiter ';' - starting with a set of weights delimite"
        "d by ',' and ending the with start/end times delimited by ':'. Ex: '0.999646,0.000354:0:4280;0.947514,0.000158:0:3859'",
        (uint8_t *)(v29 - 144),
        0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100006BDCLL);
  }
  _Unwind_Resume(a1);
}

id sub_1000078BC(int a1, void *a2, void *a3, id *a4)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 tokenSausage];
  v42 = v5;
  uint64_t v8 = [v5 interpretationIndices];
  id v9 = v7;
  id v47 = v6;
  v40 = (void *)v8;
  v10 = +[NSOrderedSet orderedSetWithArray:v8];
  v11 = [v10 array];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  if ([v11 count])
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = objc_alloc_init((Class)ASRSchemaASRUtterance);
      id v15 = objc_alloc_init((Class)NSArray);
      [v14 setInterpretationIndices:v15];

      [v12 addObject:v14];
      ++v13;
    }
    while (v13 < (unint64_t)[v11 count]);
  }
  id v46 = objc_alloc_init((Class)NSMutableArray);
  id v44 = objc_alloc_init((Class)NSMutableArray);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v9;
  id v16 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0;
    uint64_t v45 = *(void *)v58;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        id v21 = objc_alloc_init((Class)ASRSchemaASRPhrase);
        id v22 = objc_alloc_init((Class)NSMutableOrderedSet);
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_100007D6C;
        v49[3] = &unk_100050B30;
        id v23 = v12;
        uint64_t v55 = v18;
        char v56 = a1;
        id v50 = v23;
        uint64_t v51 = v20;
        id v52 = v47;
        id v53 = v46;
        id v24 = v22;
        id v54 = v24;
        [v11 enumerateObjectsUsingBlock:v49];
        if ([v24 count])
        {
          [v24 array];
          id v25 = v12;
          v27 = v26 = v11;
          id v28 = [v27 copy];
          [v21 setInterpretations:v28];

          v11 = v26;
          id v12 = v25;
          [v44 addObject:v21];
          ++v18;
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v17);
  }

  if ([v12 count])
  {
    uint64_t v29 = +[NSOrderedSet orderedSetWithArray:v12];
    id v30 = [v29 array];
  }
  else
  {
    id v30 = 0;
  }
  if (a1)
  {
    id v31 = objc_alloc_init((Class)ASRSchemaASRRecognitionResultTier1);
    [v31 setTokens:v46];
    id v32 = objc_alloc((Class)SISchemaUUID);
    v33 = +[NSUUID UUID];
    id v34 = [v32 initWithNSUUID:v33];
    [v31 setLinkId:v34];

    id v35 = v31;
    *a4 = v35;
  }
  id v36 = v30;

  id v37 = objc_alloc_init((Class)ASRSchemaASRRecognitionResult);
  [v37 setPhrases:v44];
  [v37 setUtterances:v36];

  if (a1)
  {
    v38 = [*a4 linkId];
    [v37 setLinkId:v38];
  }

  return v37;
}

void sub_100007D6C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v48 = [*(id *)(a1 + 32) objectAtIndex:a3];
  v49 = v5;
  id v6 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 72)];
  id v7 = [v6 unsignedIntegerValue];

  int v55 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v7];
  uint64_t v47 = a1;
  id v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  id v11 = v8;
  id v52 = v9;
  id v51 = v10;
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v11;
  id v56 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v56)
  {
    uint64_t v53 = *(void *)v58;
    id v54 = v12;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v15 = objc_alloc_init((Class)ASRSchemaASRToken);
        [v14 start];
        id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 doubleValue];
        uint64_t v18 = +[NSNumber numberWithDouble:v17 * 1000000000.0];
        objc_msgSend(v15, "setStartTimeInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

        [v14 end];
        v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v19 doubleValue];
        id v21 = +[NSNumber numberWithDouble:v20 * 1000000000.0];
        objc_msgSend(v15, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

        objc_msgSend(v15, "setAppendSpaceAfter:", objc_msgSend(v14, "hasSpaceAfter"));
        [v14 silenceStart];
        id v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v22 doubleValue];
        id v24 = +[NSNumber numberWithDouble:v23 * 1000000000.0];
        objc_msgSend(v15, "setSilenceStartTimeInNs:", objc_msgSend(v24, "unsignedLongLongValue"));

        [v14 confidence];
        [v15 setConfidence:(int)v25];
        if ([v14 appendedAutoPunctuation]) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = (uint64_t)[v14 prependedAutoPunctuation];
        }
        objc_msgSend(v15, "setIsAutoPunctuation:", v26, v47);
        objc_msgSend(v15, "setIsModifiedByAutoPunctuation:", objc_msgSend(v14, "isModifiedByAutoPunctuation"));
        v27 = [v14 tokenName];
        id v28 = [v27 length];
        uint64_t v29 = [v14 tokenName];
        id v30 = +[NSCharacterSet punctuationCharacterSet];
        id v31 = [v29 rangeOfCharacterFromSet:v30];
        id v33 = v32;

        if (!v31 && v28 == v33)
        {
          id v34 = [v14 tokenName];
          [v15 setPunctuationText:v34];
        }
        id v12 = v54;
        if (v55)
        {
          id v35 = objc_alloc_init((Class)ASRSchemaASRTokenTier1);
          id v36 = [v14 tokenName];
          id v37 = [v52 baseStringForEmojiString:v36];
          [v35 setText:v37];

          v38 = [v14 phoneSequence];
          [v35 setPhoneSequence:v38];

          v39 = [v14 ipaPhoneSequence];
          [v35 setIpaPhoneSequence:v39];

          if ([v51 containsObject:v35])
          {
            objc_msgSend(v15, "setLinkIndex:", objc_msgSend(v51, "indexOfObject:", v35));
          }
          else
          {
            objc_msgSend(v15, "setLinkIndex:", objc_msgSend(v51, "count"));
            [v51 addObject:v35];
          }
        }
        [v54 addObject:v15];
      }
      id v56 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v56);
  }

  if ([v12 count])
  {
    id v40 = objc_alloc_init((Class)ASRSchemaASRInterpretation);
    [v40 setTokens:v12];
    unsigned int v41 = [*(id *)(v47 + 64) containsObject:v40];
    v42 = *(void **)(v47 + 64);
    if (v41)
    {
      id v43 = [v42 indexOfObject:v40];
    }
    else
    {
      id v43 = [v42 count];
      [*(id *)(v47 + 64) addObject:v40];
    }
    id v44 = objc_msgSend(v48, "interpretationIndices", v47);
    uint64_t v45 = +[NSNumber numberWithUnsignedInteger:v43];
    id v46 = [v44 arrayByAddingObject:v45];
    [v48 setInterpretationIndices:v46];
  }
}

void sub_10000B218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_10000B244(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B254(uint64_t a1)
{
}

uint64_t sub_10000B25C(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 hasPrefix:@"LM"])
  {
    id v3 = [v10 pathExtension];
    int v4 = v3;
    if (v3) {
      id v3 = [v3 integerValue];
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if ((uint64_t)v3 >= *(void *)(v5 + 24))
    {
      *(void *)(v5 + 24) = v3;
      uint64_t v6 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v10];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }

  return _objc_release_x1();
}

void sub_10000B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B41C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    uint64_t v7 = +[NSMutableArray array];
    uint64_t v8 = [v4 elements];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 isUIApplicationElement])
          {
            id v14 = [v13 bundleIdentifier];
            if (v14) {
              [v7 addObject:v14];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    os_unfair_lock_lock(v6 + 8);
    id v15 = *(void **)&v6[2]._os_unfair_lock_opaque;
    *(void *)&v6[2]._os_unfair_lock_opaque = v7;

    os_unfair_lock_unlock(v6 + 8);
  }
}

void sub_10000C134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_10000C188(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C198(uint64_t a1)
{
}

void sub_10000C1A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v7;
    int v10 = 136315650;
    uint64_t v11 = "-[ESSpeechProfileBuilderConnection finishAndSaveProfile:completion:]_block_invoke";
    __int16 v12 = 2048;
    id v13 = [v6 count];
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Processing %lu CCSharedItems for categories: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = [[ESUserData alloc] initWithItems:v6 applicableSpeechCategories:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
}

void sub_10000D0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D0F0(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v3 = v2;
      id v4 = +[NSXPCListener _UUID];
      int v6 = 136315650;
      uint64_t v7 = "-[ESSpeechProfileBuilderConnection initWithXPCConnection:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = WeakRetained;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@ cancelling instance %@", (uint8_t *)&v6, 0x20u);
    }
    [WeakRetained[12] invalidate];
    id v5 = WeakRetained[12];
    WeakRetained[12] = 0;
  }
}

void sub_10000D4B4(id *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 isEqualToString:@"\\contact-first"]
    && (int v6 = a1 + 4, [a1[4] length])
    || [v9 isEqualToString:@"\\contact-last"]
    && (int v6 = a1 + 5, [a1[5] length])
    || [v9 isEqualToString:@"\\contact-middle"]
    && (int v6 = a1 + 6, [a1[6] length]))
  {
    id v7 = *v6;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = objc_msgSend(objc_alloc((Class)_EARWordPart), "initWithOrthography:pronunciations:tagName:frequency:phoneticOrthography:", v5, 0, v9, (int)objc_msgSend(a1[7], "frequency"), v7);

  [a1[8] addObject:v8];
}

void sub_10000D9EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 speechCategoryName];
  [v7 addObject:v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      __int16 v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v12);
        id v14 = objc_alloc((Class)_EARWordPart);
        id v15 = +[NSSet set];
        long long v16 = [v5 tagName];
        id v17 = [v14 initWithOrthography:v13 pronunciations:v15 tagName:v16 frequency:1];

        long long v18 = *(void **)(a1 + 40);
        id v26 = v17;
        long long v19 = +[NSArray arrayWithObjects:&v26 count:1];
        double v20 = [v5 speechCategoryName];
        [v18 addWordWithParts:v19 templateName:v20];

        __int16 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }
}

void sub_10000EC1C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)PPNamedEntityQuery);
  if (v9 && [v9 count]) {
    [v12 setMatchingSourceBundleIds:v9];
  }
  uint64_t v13 = [v10 dateByAddingTimeInterval:-*(double *)(a1 + 40)];
  [v12 setFromDate:v13];

  id v14 = [v11 dateByAddingTimeInterval:-*(double *)(a1 + 40)];
  [v12 setToDate:v14];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  id v15 = objc_opt_new();
  v22[6] = a5;
  id v23 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000F1D0;
  v22[3] = &unk_100050C20;
  v22[4] = *(void *)(a1 + 32);
  v22[5] = v24;
  unsigned __int8 v16 = [v15 iterRankedNamedEntitiesWithQuery:v12 error:&v23 block:v22];
  id v17 = v23;

  if (v17) {
    unsigned __int8 v18 = 0;
  }
  else {
    unsigned __int8 v18 = v16;
  }
  if ((v18 & 1) == 0)
  {
    long long v19 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v17 description];
      id v21 = [v20 UTF8String];
      *(_DWORD *)buf = 136315394;
      id v26 = "-[ESContextualData fetchNamedEntitiesWithTimeInterval:]_block_invoke";
      __int16 v27 = 2080;
      id v28 = v21;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s Error fetching Proactive named entities, error: %s", buf, 0x16u);
    }
  }
  _Block_object_dispose(v24, 8);
}

void sub_10000EE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EEA4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)_PSPredictionContext);
  [v11 setBundleID:v9];
  id v12 = [v10 dateByAddingTimeInterval:-*(double *)(a1 + 48)];
  [v11 setSuggestionDate:v12];

  uint64_t v13 = [*(id *)(a1 + 32) rankedGlobalSuggestionsFromContext:v11 contactsOnly:a4];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  if ([v13 count])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F00C;
    v14[3] = &unk_100050C70;
    v14[4] = *(void *)(a1 + 40);
    v14[5] = v15;
    v14[6] = a5;
    [v13 enumerateObjectsUsingBlock:v14];
  }
  _Block_object_dispose(v15, 8);
}

void sub_10000EFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F00C(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = [a2 recipients];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = EARContextualNamedEntitySourceFrameworkKey;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
        if (v11)
        {
          id v12 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v10) displayName];
          id v13 = [v12 length];

          if (v13)
          {
            id v14 = objc_alloc_init((Class)NSMutableDictionary);
            [v14 setObject:&off_100054120 forKey:v9];
            id v15 = *(void **)(a1[4] + 8);
            unsigned __int8 v16 = [v11 displayName];
            LODWORD(v15) = [v15 addNamedEntity2:v16 metadata:v14];

            if (v15) {
              ++*(void *)(*(void *)(a1[5] + 8) + 24);
            }
            if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
              *a4 = 1;
            }
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

void sub_10000F1D0(void *a1, void *a2, unsigned char *a3)
{
  id v16 = a2;
  id v5 = [v16 item];
  id v6 = [v5 name];

  if ([v6 length])
  {
    id v7 = [v16 item];
    uint64_t v8 = [v7 bestLanguage];
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      [v10 setObject:&off_100054108 forKey:EARContextualNamedEntitySourceFrameworkKey];
      [v16 score];
      id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v10 setObject:v11 forKey:EARContextualNamedEntityScoreKey];

      id v12 = [v16 item];
      id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 category]);
      [v10 setObject:v13 forKey:EARContextualNamedEntityCategoryKey];

      id v14 = [v16 item];
      id v15 = [v14 bestLanguage];
      [v10 setObject:v15 forKey:EARContextualNamedEntityLanguageKey];

      if ([*(id *)(a1[4] + 8) addNamedEntity2:v6 metadata:v10]) {
        ++*(void *)(*(void *)(a1[5] + 8) + 24);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
        *a3 = 1;
      }
    }
  }
}

void sub_10000F4F0()
{
  AFLogInitIfNeeded();
  if (qword_10005D9B0 != -1)
  {
    dispatch_once(&qword_10005D9B0, &stru_100050CB8);
  }
}

void sub_10000F540(id a1)
{
  os_log_t v1 = os_log_create("com.apple.siri", "Speech");
  v2 = (void *)qword_10005D9F8;
  qword_10005D9F8 = (uint64_t)v1;

  id v3 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "ESLogInitIfNeeded_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ::: embeddedspeech logging initialized.", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000FAFC(id a1, ESVocabularyLabel *a2, NSOrderedSet *a3, BOOL *a4)
{
  id v6 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v7 = v6;
    uint64_t v8 = a2;
    NSUInteger v9 = [(NSOrderedSet *)a3 count];
    id v10 = [(ESVocabularyLabel *)v8 speechCategoryName];
    id v11 = [(ESVocabularyLabel *)v8 tagName];

    int v12 = 136315906;
    id v13 = "-[ESUserData _populateUserDataFromItems:applicableSpeechCategories:]_block_invoke";
    __int16 v14 = 2048;
    NSUInteger v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    long long v19 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Processed %tu items for (%@, %@).", (uint8_t *)&v12, 0x2Au);
  }
}

void sub_100010670(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[ESUserData _vocabularyLabelsForFieldType:](ESUserData, "_vocabularyLabelsForFieldType:", [v3 fieldType]);
  if (v4)
  {
    unsigned int v5 = [v3 dataType];
    if (v5 == 1)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = objc_msgSend(v3, "repeatedStringValue", 0);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            +[ESUserData _addVocabWord:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) vocabularyLabels:v4 toVocabularyWords:*(void *)(a1 + 32)];
            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
    else if (!v5)
    {
      id v6 = [v3 stringValue];
      +[ESUserData _addVocabWord:v6 vocabularyLabels:v4 toVocabularyWords:*(void *)(a1 + 32)];
    }
  }
}

void sub_10001095C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 fieldType] == 49070)
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = [v5 stringValue];
    [v3 addObject:v4];
  }
}

void sub_100011038(uint64_t a1, void *a2)
{
  id v21 = a2;
  int v3 = [v21 fieldType];
  if (v3 > 61354)
  {
    if (v3 == 61355)
    {
      id v5 = [v21 stringValue];
      [*(id *)(a1 + 32) setValue:v5 forKey:@"\\personFullName-first"];
      id v7 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
      id v8 = [v7 personNameComponentsFromString:v5];
      id v9 = [v8 givenName];
      id v10 = [v9 length];

      if (v10)
      {
        id v11 = *(void **)(a1 + 32);
        long long v12 = [v8 givenName];
        [v11 setValue:v12 forKey:@"\\appcontact-first"];
      }
      long long v13 = [v8 middleName];
      id v14 = [v13 length];

      if (v14)
      {
        long long v15 = *(void **)(a1 + 32);
        __int16 v16 = [v8 middleName];
        [v15 setValue:v16 forKey:@"\\appcontact-middle"];
      }
      id v17 = [v8 familyName];
      id v18 = [v17 length];

      if (v18)
      {
        long long v19 = *(void **)(a1 + 32);
        long long v20 = [v8 familyName];
        [v19 setValue:v20 forKey:@"\\appcontact-last"];
      }
    }
    else
    {
      if (v3 == 63372)
      {
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\smsGroupName-first";
      }
      else
      {
        if (v3 != 61513) {
          goto LABEL_25;
        }
LABEL_7:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-first";
      }
LABEL_23:
      [v4 setValue:v5 forKey:v6];
    }
  }
  else
  {
    switch(v3)
    {
      case 19679:
        goto LABEL_7;
      case 19680:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-middle";
        goto LABEL_23;
      case 19681:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-last";
        goto LABEL_23;
      case 19683:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-nickname";
        goto LABEL_23;
      case 19693:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\company-first";
        goto LABEL_23;
      case 19696:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-first-phonetic";
        goto LABEL_23;
      case 19697:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-middle-phonetic";
        goto LABEL_23;
      case 19698:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\contact-last-phonetic";
        goto LABEL_23;
      case 19699:
        int v4 = *(void **)(a1 + 32);
        id v5 = [v21 stringValue];
        CFStringRef v6 = @"\\company-first-phonetic";
        goto LABEL_23;
      default:
        break;
    }
  }
LABEL_25:
}

void sub_1000117E8(uint64_t a1)
{
  v2 = +[CESRGeoLMRegionIDCache sharedInstance];
  id v6 = [v2 purgeUnusedGeoLMRegionIdFromCacheForLanguage:*(void *)(a1 + 32)];

  if (v6)
  {
    id v3 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:*(void *)(a1 + 32) assetType:5];
    int v4 = +[NSBundle mainBundle];
    id v5 = [v4 bundleIdentifier];
    +[SFEntitledAssetManager unsubscribeFromAssetWithConfig:v3 regionId:v6 subscriberId:v5];
  }
}

void sub_100011A88(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[ESAssetManager _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s GeoLM: Exception thrown while reading json configs", (uint8_t *)&a9, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1000119B4);
  }
  _Unwind_Resume(a1);
}

void sub_100011E1C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s GeoLM: Exception thrown while reading geo-config json", (uint8_t *)&a9, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x100011D0CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1000123DC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[ESAssetManager validateHammerConfigFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Exception thrown while reading hammer config", (uint8_t *)&a9, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1000123A4);
  }
  _Unwind_Resume(a1);
}

void sub_100012858(id a1, NSString *a2, NSString *a3, BOOL *a4)
{
  id v6 = a2;
  if (AFOfflineDictationStatusStringIsInstalled())
  {
    id v4 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v6 assetType:3];
    id v5 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
    +[SFEntitledAssetManager subscribeToAssetWithConfig:v4 regionId:0 subscriberId:v5 expiration:0];
  }
}

void sub_1000129B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 bundleIdentifier];
  id v8 = +[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:v2 exceptLanguages:v3 subscriberId:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 3)
  {
    id v7 = +[CESRGeoLMRegionIDCache sharedInstance];
    [v7 purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:v8];

    uint64_t v6 = *(void *)(a1 + 48);
  }
  [*(id *)(a1 + 40) _invalidateInstallationStatusCacheForAssetType:v6];
}

void sub_100012E68(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)UAFAssetUtilities);
  [v2 refreshUnderstandingOnDeviceAssetsAvailableAsync];
  if ([v2 understandingOnDeviceAssetsAvailable])
  {
    v5[0] = @"language";
    v5[1] = @"assetType";
    uint64_t v3 = *(void *)(a1 + 40);
    v6[0] = *(void *)(a1 + 32);
    v6[1] = v3;
    id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
    +[CESRUtilities generateABCSnapshotForType:@"CoreSpeech" subType:@"assets_missing" context:v4];
  }
}

uint64_t sub_1000133A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000133B0(uint64_t a1)
{
}

void sub_1000133B8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ((!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) || *(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57))
    && [*(id *)(a1 + 32) isTrialAssetDeliveryEnabled])
  {
    id v7 = objc_alloc_init((Class)SFEntitledAssetManager);
    int v8 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v9 = *(void *)(a1 + 48);
    id v14 = v7;
    if (*(unsigned char *)(a1 + 57))
    {
      id v2 = +[NSBundle mainBundle];
      uint64_t v3 = [v2 bundleIdentifier];
      [v14 detailedInstallationStatusForLanguagesWithAssetType:v9 subscriberId:v3];
    }
    else
    {
      [v7 installationStatusForLanguagesWithAssetType:v9];
    id v10 = };
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
    if (v8)
    {

      id v10 = v2;
    }

    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v12 = *(void **)(*(void *)(a1 + 32) + 16);
    long long v13 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
}

void sub_1000135AC(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  uint64_t v5 = a2;
  int v6 = [(NSNumber *)a3 intValue];
  if (v6 != -1)
  {
    uint32_t v7 = notify_cancel(v6);
    if (v7)
    {
      uint32_t v8 = v7;
      uint64_t v9 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315650;
        uint64_t v11 = "-[ESAssetManager dealloc]_block_invoke";
        __int16 v12 = 2112;
        long long v13 = v5;
        __int16 v14 = 1024;
        uint32_t v15 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Failed to cancel notification %@: %u", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
}

void sub_100013944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
}

void sub_100013978(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateInstallationStatusCacheForAssetType:3];
}

void sub_100013AE4(id a1)
{
  qword_10005D9B8 = objc_alloc_init(ESAssetManager);

  _objc_release_x1();
}

void sub_100014494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void sub_1000144E4(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] == (id)2)
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    uint64_t v5 = [v4 unsignedLongLongValue];

    int v6 = [v3 objectAtIndex:1];
    uint32_t v7 = [v6 unsignedLongLongValue];

    if (*(void *)(a1[4] + 488))
    {
      os_signpost_id_t v8 = os_signpost_id_generate(AFSiriLogContextSpeech);
      uint64_t v9 = AFSiriLogContextSpeech;
      int v10 = v9;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        uint64_t v11 = AFSiriLogContextSpeech;
      }
      else
      {
        if (os_signpost_enabled(v9))
        {
          int v13 = 134349056;
          __int16 v14 = v5;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ES: ITN Process", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v13, 0xCu);
        }

        uint64_t v11 = AFSiriLogContextSpeech;
        if (os_signpost_enabled(v11))
        {
          int v13 = 134349056;
          __int16 v14 = v7;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v8, "ES: ITN Process", "%{public, signpost.description:end_time}llu", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    +[CESRUtilities hostTimeToSeconds:v7 - v5];
    *(double *)(*(void *)(a1[5] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24) + v12;
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
}

void sub_1000146D4(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] == (id)2)
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    uint64_t v5 = [v4 unsignedLongLongValue];

    int v6 = [v3 objectAtIndex:1];
    uint32_t v7 = [v6 unsignedLongLongValue];

    if (*(void *)(a1[4] + 488))
    {
      os_signpost_id_t v8 = os_signpost_id_generate(AFSiriLogContextSpeech);
      uint64_t v9 = AFSiriLogContextSpeech;
      int v10 = v9;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        uint64_t v11 = AFSiriLogContextSpeech;
      }
      else
      {
        if (os_signpost_enabled(v9))
        {
          int v13 = 134349056;
          __int16 v14 = v5;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ES: Secondary Pass Process", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v13, 0xCu);
        }

        uint64_t v11 = AFSiriLogContextSpeech;
        if (os_signpost_enabled(v11))
        {
          int v13 = 134349056;
          __int16 v14 = v7;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v8, "ES: Secondary Pass Process", "%{public, signpost.description:end_time}llu", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    +[CESRUtilities hostTimeToSeconds:v7 - v5];
    *(double *)(*(void *)(a1[5] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24) + v12;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = (2 * *(_DWORD *)(*(void *)(a1[6] + 8) + 24)) | 1;
  }
}

void sub_100017020(uint64_t a1)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:1];
  id v2 = [v8 objectAtIndex:0];
  [v2 floatValue];
  float v4 = v3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:0];
  int v6 = [v5 objectAtIndex:0];
  [v6 floatValue];
  *(double *)&qword_10005D9E0 = (float)(v4 - v7);
}

uint64_t sub_1000172B4(uint64_t a1)
{
  qword_10005D9C8 = [[ESProfiler alloc] initWithESSelfHelper:0 signpostHelper:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_1000179D0(uint64_t a1, void *a2)
{
  float v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 nBest];
  int v6 = [v4 formattedRecognitionWithNBestList:v5];

  float v7 = qword_10005D9E8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100017BE8;
  v10[3] = &unk_1000513D0;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v8;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void sub_100017AAC(uint64_t a1)
{
  id v2 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    float v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 oneBest];
    int v6 = [v5 valueForKey:@"tokenName"];
    int v9 = 136315394;
    int v10 = "-[ESConnection speechRecognizer:didRecognizeRawEagerRecognitionCandidate:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s raw eager recognition candidate: %@", (uint8_t *)&v9, 0x16u);
  }
  float v7 = [*(id *)(a1 + 40) _delegate];
  uint64_t v8 = +[CESRUtilities afRecognitionForEARSausage:*(void *)(a1 + 32) processedAudioDuration:*(double *)(*(void *)(a1 + 40) + 144)];
  [v7 speechServiceDidRecognizeRawEagerRecognitionCandidate:v8];
}

void sub_100017BE8(uint64_t a1)
{
  id v2 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    float v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 oneBest];
    int v6 = [v5 valueForKey:@"tokenName"];
    int v9 = 136315394;
    int v10 = "-[ESConnection speechRecognizer:didRecognizeRawEagerRecognitionCandidate:]_block_invoke_2";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s #ASR on device eager formatted recognition candidate: %@", (uint8_t *)&v9, 0x16u);
  }
  float v7 = [*(id *)(a1 + 40) _delegate];
  uint64_t v8 = +[CESRUtilities afRecognitionForEARSausage:*(void *)(a1 + 32) processedAudioDuration:*(double *)(*(void *)(a1 + 40) + 144)];
  [v7 speechServiceDidRecognizeRawEagerRecognitionCandidate:v8];
}

void sub_100017E60(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _delegate];
  [v2 speechServiceDidProcessAudioDuration:*(double *)(a1 + 48)];

  float v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 136315394;
    float v7 = "-[ESConnection speechRecognizer:didProcessAudioDuration:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s didProcessAudioDuration %f", (uint8_t *)&v6, 0x16u);
  }
  id v4 = +[ESProfiler sharedProfiler];
  [v4 logTotalAudioProcessedOfDuration:*(void *)(a1 + 40) timeInTicks:*(double *)(a1 + 48)];
}

void sub_100018038(uint64_t a1)
{
  uint64_t v2 = +[ESProfiler sharedProfiler];
  float v3 = (void *)qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = v3;
    double v7 = [v4 statusForError:v5];
    *(_DWORD *)buf = 136315394;
    v127 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v128 = 2114;
    double v129 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Recognition finished with status %{public}@", buf, 0x16u);
  }
  __int16 v8 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    int v10 = +[NSProcessInfo processInfo];
    [v10 systemUptime];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    double v14 = v13 - *(double *)(v11 + 168);
    uint32_t v15 = *(void **)(v11 + 32);
    *(_DWORD *)buf = 136315906;
    v127 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v128 = 2048;
    double v129 = v14;
    __int16 v130 = 2112;
    v131 = v15;
    __int16 v132 = 2112;
    uint64_t v133 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Audio finish to recognizer finish = %lf sec, connection is %@, error %@", buf, 0x2Au);
  }
  __int16 v16 = +[NSProcessInfo processInfo];
  [v16 systemUptime];
  *(void *)(*(void *)(a1 + 32) + 248) = v17;

  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 256) = CFAbsoluteTimeGetCurrent();
  *(void *)(*(void *)(a1 + 32) + 328) = 0;
  +[CESRUtilities noteSuccessfulUse];
  +[ESConnection _scheduleCooldownTimer];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if ([WeakRetained concatenateUtterances])
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 40);

    if (!v19) {
      goto LABEL_14;
    }
    if ([*(id *)(a1 + 48) enableVoiceCommands]
      && ([*(id *)(a1 + 32) _delegate],
          long long v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = objc_opt_respondsToSelector(),
          v20,
          (v21 & 1) != 0))
    {
      long long v22 = [*(id *)(a1 + 32) _delegate];
      [v22 speechServiceDidRecognizePackage:*(void *)(*(void *)(a1 + 32) + 40) withMetadata:*(void *)(*(void *)(a1 + 32) + 48)];

      id v23 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        double v24 = *(double *)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 136315394;
        v127 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
        __int16 v128 = 2112;
        double v129 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s AFSpeechInfo Package %@", buf, 0x16u);
      }
    }
    else
    {
      long long v25 = [*(id *)(a1 + 32) _delegate];
      [v25 speechServiceDidRecognizePackage:*(void *)(*(void *)(a1 + 32) + 40)];
    }
    uint64_t v26 = *(void *)(a1 + 32);
    __int16 v27 = *(void **)(v26 + 48);
    *(void *)(v26 + 48) = 0;

    uint64_t v28 = *(void *)(a1 + 32);
    id WeakRetained = *(id *)(v28 + 40);
    *(void *)(v28 + 40) = 0;
  }

LABEL_14:
  v124 = (void *)v2;
  uint64_t v29 = [*(id *)(a1 + 48) recognitionUtterenceStatistics];
  id v30 = *(void **)(*(void *)(a1 + 32) + 232);
  if (!v30)
  {
    id v31 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v32 = *(void *)(a1 + 32);
    id v33 = *(void **)(v32 + 232);
    *(void *)(v32 + 232) = v31;

    id v30 = *(void **)(*(void *)(a1 + 32) + 232);
  }
  id v34 = [*(id *)(a1 + 48) recognitionStatistics];
  [v30 addEntriesFromDictionary:v34];

  uint64_t v35 = [v29 valueForKey:@"recognizer-components"];
  id v36 = (void *)v35;
  if (v35) {
    CFStringRef v37 = (const __CFString *)v35;
  }
  else {
    CFStringRef v37 = &stru_1000519F0;
  }
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v37 forKeyedSubscript:@"recognizer-components"];

  uint64_t v38 = [v29 valueForKey:@"lm_interp_weights"];
  v39 = (void *)v38;
  if (v38) {
    CFStringRef v40 = (const __CFString *)v38;
  }
  else {
    CFStringRef v40 = &stru_1000519F0;
  }
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v40 forKeyedSubscript:@"lm_interp_weights"];

  unsigned int v41 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 128)];
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v41 forKeyedSubscript:@"audioDurationMs"];

  v42 = [*(id *)(a1 + 48) recognitionStatistics];
  uint64_t v43 = *(void *)(a1 + 32);
  double v45 = *(double *)(v43 + 240);
  double v44 = *(double *)(v43 + 248);
  if (v45 <= v44)
  {
    double v47 = (v44 - v45) * 1000.0;
  }
  else
  {
    id v46 = (void *)AFSiriLogContextSpeech;
    double v47 = -1.0;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v48 = v46;
      double v49 = +[NSNumber numberWithDouble:v45];
      id v50 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 248)];
      *(_DWORD *)buf = 136315650;
      v127 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      __int16 v128 = 2112;
      double v129 = v49;
      __int16 v130 = 2112;
      v131 = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s _recognitionBeginTime (%@) is greater than _recognitionEndTime (%@)", buf, 0x20u);
    }
  }
  id v51 = +[NSNumber numberWithDouble:v47];
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v51 forKeyedSubscript:@"recognitionDurationMs"];

  uint64_t v52 = *(void *)(a1 + 32);
  if (*(void *)(v52 + 112))
  {
    [*(id *)(v52 + 112) setRecognitionEndTime:*(double *)(v52 + 256)];
    uint64_t v52 = *(void *)(a1 + 32);
  }
  uint64_t v53 = [(id)v52 _delegate];
  [v53 speechServiceDidFinishRecognitionWithStatistics:*(void *)(*(void *)(a1 + 32) + 232) error:*(void *)(a1 + 40)];

  id v54 = [*(id *)(a1 + 48) recognitionMetrics];
  int v55 = [v54 pauseDurations];

  [v55 enumerateObjectsUsingBlock:&stru_100051518];
  if (v55)
  {
    id v56 = [v55 valueForKeyPath:@"@sum.self"];
  }
  else
  {
    id v56 = 0;
  }
  v115 = v56;
  [v56 doubleValue];
  double v58 = *(double *)(*(void *)(a1 + 32) + 128);
  v123 = v55;
  if (v58 == 0.0)
  {
    v122 = 0;
  }
  else
  {
    double v59 = v58 + v57 * -1000.0;
    long long v60 = [v42 objectForKey:EARRecognitionStatisticRecogCpuTime];
    [v60 doubleValue];
    v122 = +[NSNumber numberWithDouble:v61 / v59];
  }
  v62 = [*(id *)(a1 + 48) recognitionMetrics];
  uint64_t v113 = *(void *)(a1 + 40);
  v121 = [v29 valueForKey:@"recognizer-components"];
  v120 = [v42 valueForKey:@"AverageActiveTokensPerFrame"];
  v111 = [v29 valueForKey:@"lm_interp_weights"];
  v110 = [v42 valueForKey:@"SNR"];
  v108 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 248) - *(double *)(*(void *)(a1 + 32) + 240)];
  v119 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 128)];
  v118 = [v42 valueForKey:@"EagerUsed"];
  id v112 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  unsigned __int8 v107 = [v112 detectUtterances];
  id v109 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  unsigned __int8 v106 = [v109 concatenateUtterances];
  v116 = v42;
  v105 = [v42 valueForKey:@"numLmeDataStreams"];
  v104 = [v29 valueForKey:@"PM-decoder"];
  v101 = [v62 itnDurationInNs];
  unsigned __int8 v103 = [v62 isEmojiPersonalizationUsed];
  unsigned __int8 v102 = [v62 isEmojiDisambiguationUsed];
  unsigned __int8 v63 = [v62 isEmojiExpectedButNotRecognized];
  v100 = [v62 recognizedEmojis];
  v114 = v62;
  v99 = [v62 allItnRunIntervals];
  v117 = v29;
  v64 = [v29 valueForKey:@"ANEUsed"];
  uint64_t v65 = qword_10005DA28;
  id v66 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v67 = [v66 modelInfo];
  v68 = [v67 version];
  BYTE2(v98) = v63;
  BYTE1(v98) = v102;
  LOBYTE(v98) = v103;
  BYTE1(v97) = v106;
  LOBYTE(v97) = v107;
  objc_msgSend(v124, "logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:recognizedEmojis:allItnRunIntervals:allSecondaryPassIntervals:powerLogEvent:aneUsed:language:modelVersion:applicationName:", v113, v121, v120, v111, v110, v108, v119, v118, v97, v122, v105, v104, v123,
    v101,
    v98,
    v100,
    v99,
    &__NSArray0__struct,
    @"didFinishRecognitionWithError",
    v64,
    v65,
    v68,
    *(void *)(*(void *)(a1 + 32) + 368));

  if (([*(id *)(*(void *)(a1 + 32) + 304) isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto] & 1) == 0&& (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 304), "isEqualToString:", CoreEmbeddedSpeechRecognizerTaskBetoDictation) & 1) == 0)
  {
    v69 = [v117 valueForKey:@"PM-input"];
    v70 = [v117 valueForKey:@"PM-output"];
    [v124 logIntermediateUtteranceInfoTier1WithPmInput:v69 pmOutput:v70];
  }
  [v124 logFirstAudioPacketRecordedWithTimeInTicks:*(void *)(*(void *)(a1 + 32) + 184)];
  [v124 logAudioPacketArrivalStartedOrChangedWithTimeInTicks:*(void *)(*(void *)(a1 + 32) + 192)];
  [v124 logAudioPacketArrivalEndedWithTimeInTicks:*(void *)(*(void *)(a1 + 32) + 200)];
  [v124 logPendingANEModelInitializationContextEvents:qword_10005DAC0];
  id v71 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v71 cancelRecognition];

  id v72 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v73 = qword_10005DA00;

  if (v72 == (id)v73)
  {
    v74 = (void *)qword_10005DA00;
    qword_10005DA00 = 0;
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), 0);
  [v124 setESSelfHelper:0];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), 0);
  uint64_t v75 = *(void *)(a1 + 40);
  if (!v75 && qword_10005DA78)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018DB8;
    block[3] = &unk_100051540;
    block[4] = *(void *)(a1 + 32);
    dispatch_block_t v76 = dispatch_block_create((dispatch_block_flags_t)0, block);
    v77 = (void *)qword_10005DA88;
    qword_10005DA88 = (uint64_t)v76;

    dispatch_time_t v78 = dispatch_time(0, 30000000000);
    dispatch_after(v78, (dispatch_queue_t)qword_10005D9E8, (dispatch_block_t)qword_10005DA88);
    v79 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v127 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%s Submitted delayedBlock to dispatch_after", buf, 0xCu);
    }
    uint64_t v75 = *(void *)(a1 + 40);
  }
  if (v75) {
    goto LABEL_45;
  }
  dispatch_block_t v81 = dispatch_block_create((dispatch_block_flags_t)0, &stru_100051560);
  v82 = (void *)qword_10005DA90;
  qword_10005DA90 = (uint64_t)v81;

  dispatch_time_t v83 = dispatch_time(0, 30000000000);
  dispatch_after(v83, (dispatch_queue_t)qword_10005D9E8, (dispatch_block_t)qword_10005DA90);
  v84 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v127 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%s Submitted editDelayedBlock to dispatch_after", buf, 0xCu);
  }
  uint64_t v80 = *(void *)(a1 + 32);
  if (!*(void *)(a1 + 40) && *(unsigned char *)(v80 + 24) && !*(unsigned char *)(v80 + 27) && *(void *)(v80 + 104))
  {
    v96 = +[CESRDictationOnDeviceSampling sharedManager];
    [v96 incrementSampledRequestCount];

LABEL_45:
    uint64_t v80 = *(void *)(a1 + 32);
  }
  v85 = *(void **)(v80 + 104);
  if (v85)
  {
    if (!*(void *)(a1 + 40))
    {
      [v85 saveAudioToDisk];
      uint64_t v80 = *(void *)(a1 + 32);
      v85 = *(void **)(v80 + 104);
    }
    *(void *)(v80 + 104) = 0;

    uint64_t v80 = *(void *)(a1 + 32);
  }
  v86 = *(void **)(v80 + 112);
  if (v86)
  {
    if (!*(void *)(a1 + 40))
    {
      [v86 sendEvent];
      uint64_t v80 = *(void *)(a1 + 32);
      v86 = *(void **)(v80 + 112);
    }
    *(void *)(v80 + 112) = 0;

    uint64_t v80 = *(void *)(a1 + 32);
  }
  v87 = *(void **)(v80 + 232);
  if (v87)
  {
    *(void *)(v80 + 232) = 0;

    uint64_t v80 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v80 + 208) = 0;
  uint64_t v88 = *(void *)(a1 + 32);
  v89 = *(void **)(v88 + 192);
  *(void *)(v88 + 192) = 0;

  *(void *)(*(void *)(a1 + 32) + 152) = 0x10000000000000;
  *(void *)(*(void *)(a1 + 32) + 160) = 0x10000000000000;
  uint64_t v90 = *(void *)(a1 + 32);
  v91 = *(void **)(v90 + 368);
  *(void *)(v90 + 368) = 0;

  [*(id *)(*(void *)(a1 + 32) + 336) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 344) removeAllObjects];
  uint64_t v92 = *(void *)(a1 + 32);
  v93 = *(void **)(v92 + 40);
  *(void *)(v92 + 40) = 0;

  uint64_t v94 = *(void *)(a1 + 32);
  v95 = *(void **)(v94 + 48);
  *(void *)(v94 + 48) = 0;

  [*(id *)(a1 + 32) startRequestActivityWithCompletion:0];
}

void sub_100018DB8(uint64_t a1)
{
  os_log_t v1 = (void *)qword_10005DA78;
  if (qword_10005DA78)
  {
    float v3 = (void *)AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      id v4 = v3;
      uint64_t v5 = [v1 interactionIdentifier];
      int v9 = 136315394;
      int v10 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Writing DES record after 30 seconds delay: interactionId=%@", (uint8_t *)&v9, 0x16u);
    }
    int v6 = +[AFPreferences sharedPreferences];
    id v7 = [v6 siriDataSharingOptInStatus];

    [*(id *)(a1 + 32) _writeDESRecord:&qword_10005DA78 oneRecordPerDay:v7 == (id)1];
    __int16 v8 = (void *)qword_10005DA88;
    qword_10005DA88 = 0;
  }
}

void sub_100018EEC(id a1)
{
  os_log_t v1 = (void *)qword_10005DA98;
  if (qword_10005DA98)
  {
    uint64_t v2 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      id v4 = v2;
      uint64_t v5 = [v1 interactionId];
      int v6 = 136315394;
      id v7 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      __int16 v8 = 2112;
      int v9 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Send edit event to Biome after 30 seconds delay, interactionId=%@", (uint8_t *)&v6, 0x16u);

      os_log_t v1 = (void *)qword_10005DA98;
    }
    [v1 sendEvent];
    float v3 = (void *)qword_10005DA90;
    qword_10005DA90 = 0;
  }
}

void sub_100018FF4(id a1, NSNumber *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  uint64_t v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s PauseDuration = %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100019314(id *a1)
{
  uint64_t v2 = +[ESProfiler sharedProfiler];
  ++*((void *)a1[5] + 39);
  float v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  setEARPackageResultCandidateId();

  id v4 = a1[4];
  double v5 = *((double *)a1[5] + 18);
  BOOL v6 = [(id)qword_10005DA58 count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 1);
  __int16 v8 = [WeakRetained modelInfo];
  int v9 = +[CESRUtilities afSpeechPackageForEARPackage:v4 processedAudioDuration:v6 speechProfileUsed:v8 recognizerModelInfo:0 isVoiceCommandCandidatePackage:v5];

  int v10 = +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:a1[4]];
  unsigned int v11 = +[CESRUtilities hasRecognizedAnythingInAFSpeechPackage:v9];
  if (v11)
  {
    uint64_t v12 = a1[5];
    double v13 = (void *)v12[13];
    if (v13)
    {
      [v13 markRecognition];
      uint64_t v12 = a1[5];
    }
    double v14 = (void *)v12[14];
    if (v14) {
      [v14 markRecognition];
    }
    if (qword_10005DA78) {
      [(id)qword_10005DA78 markRecognition];
    }
    if (qword_10005DA98) {
      [(id)qword_10005DA98 markRecognition];
    }
  }
  id v15 = objc_loadWeakRetained((id *)a1[5] + 1);
  unsigned int v16 = [v15 concatenateUtterances];

  if (v16)
  {
    objc_storeStrong((id *)a1[5] + 5, v9);
    objc_storeStrong((id *)a1[5] + 6, v10);
  }
  else
  {
    if ([v9 recognitionPaused])
    {
      uint64_t v17 = [a1[5] dummyResultPackage:v9];

      int v9 = (void *)v17;
    }
    if ([a1[6] enableVoiceCommands]
      && ([a1[5] _delegate],
          id v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = objc_opt_respondsToSelector(),
          v18,
          (v19 & 1) != 0))
    {
      long long v20 = [a1[5] _delegate];
      [v20 speechServiceDidRecognizePackage:v9 withMetadata:v10];

      char v21 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v100 = "-[ESConnection speechRecognizer:didRecognizeFinalResultPackage:]_block_invoke";
        __int16 v101 = 2112;
        id v102 = v10;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s AFSpeechInfo Package %@", buf, 0x16u);
      }
    }
    else
    {
      long long v22 = [a1[5] _delegate];
      [v22 speechServiceDidRecognizePackage:v9];
    }
  }
  if ((v11 & +[CESRUtilities isTaskDictationSpecific:](CESRUtilities, "isTaskDictationSpecific:", *((void *)a1[5] + 38))) == 1&& ([a1[6] detectUtterances]&& !objc_msgSend(a1[6], "concatenateUtterances")|| objc_msgSend(a1[4], "isFinal")))
  {
    unsigned int v93 = v11;
    uint64_t v94 = v10;
    v95 = v9;
    id v24 = a1[4];
    id v23 = a1[5];
    uint64_t v25 = v23[43];
    uint64_t v26 = v23[41];
    __int16 v27 = v2;
    uint64_t v28 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v96 = v27;
    [v27 logFinalResultGeneratedWithEARPackage:v24 firstSeenPartialResultTokens:v25 partialResultOffset:v26 timeInTicks:v28];

    id v29 = [*((id *)a1[5] + 42) count];
    id v30 = [a1[4] correctPartialResultIndexList];
    id v31 = [v30 count];

    if (v31 && v29)
    {
      uint64_t v32 = [a1[4] correctPartialResultIndexList];
      int v33 = [v32 count];

      if (v33 < 1)
      {
        v77 = &stru_1000519F0;
      }
      else
      {
        uint64_t v34 = 0;
        int v35 = 0;
        id v36 = &stru_1000519F0;
        double v37 = 0.0;
        double v38 = 1.79769313e308;
        double v39 = 0.0;
        id v97 = v29;
        do
        {
          CFStringRef v40 = [a1[4] correctPartialResultIndexList];
          unsigned int v41 = [v40 objectAtIndex:v34];
          unsigned int v42 = [v41 unsignedIntValue];

          if ((unint64_t)v29 > v42)
          {
            int v98 = v35;
            uint64_t v43 = v42;
            double v44 = [a1[4] preITNRecognition];
            double v45 = [v44 oneBest];
            id v46 = [v45 objectAtIndex:v34];
            [v46 silenceStart];
            double v48 = v47;
            [a1[4] utteranceStart];
            double v50 = v48 + v49;

            id v51 = [*((id *)a1[5] + 42) objectAtIndex:v43];
            [v51 doubleValue];
            double v53 = v52;

            double v54 = *((double *)a1[5] + 19);
            int v55 = [a1[4] preITNRecognition];
            id v56 = [v55 oneBest];
            double v57 = [v56 objectAtIndex:v34];
            double v58 = [v57 tokenName];

            double v59 = (char *)[*((id *)a1[5] + 24) unsignedLongLongValue];
            *(float *)&double v60 = v50;
            double v61 = &v59[(void)+[CESRUtilities secondsToHostTime:v60]];
            v62 = [*((id *)a1[5] + 42) objectAtIndex:v43];
            [v62 doubleValue];
            *(float *)&double v63 = v63;
            id v64 = +[CESRUtilities secondsToHostTime:v63];

            uint64_t v65 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:v61];
            id v66 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:v64];
            if (v66 >= v65)
            {
              v67 = v66;
              os_signpost_id_t v68 = os_signpost_id_generate(AFSiriLogContextSpeech);
              v69 = AFSiriLogContextSpeech;
              v70 = v69;
              if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL)
              {

                id v72 = AFSiriLogContextSpeech;
              }
              else
              {
                if (os_signpost_enabled(v69))
                {
                  id v71 = [v58 UTF8String];
                  *(_DWORD *)buf = 134349314;
                  v100 = v65;
                  __int16 v101 = 2080;
                  id v102 = v71;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_BEGIN, v68, "ES: Time to Word", "%{public, signpost.description:begin_time}llu %s", buf, 0x16u);
                }

                id v72 = AFSiriLogContextSpeech;
                if (os_signpost_enabled(v72))
                {
                  *(_DWORD *)buf = 134349056;
                  v100 = v67;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v72, OS_SIGNPOST_INTERVAL_END, v68, "ES: Time to Word", "%{public, signpost.description:end_time}llu", buf, 0xCu);
                }
              }
            }
            int v35 = v98 + 1;
            double v73 = v53 - (v50 + v54);
            uint64_t v74 = +[NSString stringWithFormat:@"%@ %@:%f,", v36, v58, *(void *)&v73];

            double v37 = v37 + v73;
            if (v39 < v73) {
              double v39 = v73;
            }
            if (v38 >= v73) {
              double v38 = v73;
            }

            id v36 = (__CFString *)v74;
            id v29 = v97;
          }
          ++v34;
          uint64_t v75 = [a1[4] correctPartialResultIndexList];
          signed int v76 = [v75 count];
        }
        while (v34 < v76);
        if (v35 <= 0)
        {
          v77 = v36;
        }
        else
        {
          v77 = +[NSString stringWithFormat:@"%@ TTAW:%f MEAN:%f, MAX:%f, MIN:%f ", v36, *(void *)&v37, v37 / (double)v35, *(void *)&v39, *(void *)&v38];

          os_signpost_id_t v78 = os_signpost_id_generate(AFSiriLogContextSpeech);
          v79 = AFSiriLogContextSpeech;
          uint64_t v80 = v79;
          if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
          {
            *(_DWORD *)buf = 138412290;
            v100 = (const char *)v77;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_EVENT, v78, "ES: TTAW", "Partially Recognized Results: %@", buf, 0xCu);
          }
        }
      }
    }
    [*((id *)a1[5] + 43) removeAllObjects];
    *((void *)a1[5] + 41) += *((void *)a1[5] + 40);
    *((void *)a1[5] + 40) = 0;
    int v9 = v95;
    uint64_t v2 = v96;
    int v10 = v94;
    unsigned int v11 = v93;
  }
  if ((([*((id *)a1[5] + 38) isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging] & 1) != 0|| objc_msgSend(*((id *)a1[5] + 38), "isEqualToString:", CoreEmbeddedSpeechRecognizerTaskSiriDictation))&& ((objc_msgSend(v9, "isFinal") | v11 ^ 1) & 1) == 0)
  {
    id v81 = a1[4];
    v82 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v2 logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v81 loggableSharedUserId:0 timeInTicks:v82];
  }
  dispatch_time_t v83 = [a1[4] preITNRecognition];
  v84 = [v83 oneBest];
  v85 = [v84 lastObject];

  if (v85 && ([a1[4] isFinal] & 1) == 0)
  {
    id v86 = a1[5];
    [v85 silenceStart];
    *(float *)&double v87 = v87;
    [v86 _packetReadyUpstreamTimestampsFromAudioTime:v87];
    v89 = uint64_t v88 = v10;
    [v2 logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:v89 loggableSharedUserId:0 earPackage:a1[4]];
    id v90 = objc_loadWeakRetained((id *)a1[5] + 2);
    [v85 silenceStart];
    *(float *)&double v91 = v91;
    uint64_t v92 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v90 packetArrivalTimestampFromAudioTime:v91]);

    [v2 logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:v92 loggableSharedUserId:0 earPackage:a1[4]];
    int v10 = v88;
  }
}

void sub_100019D34(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      double v13 = "-[ESConnection speechRecognizer:didRecognizeFinalResultCandidatePackage:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(*(void *)(a1 + 32) + 144);
    BOOL v7 = [(id)qword_10005DA58 count] != 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    int v9 = [WeakRetained modelInfo];
    int v10 = +[CESRUtilities afSpeechPackageForEARPackage:v5 processedAudioDuration:v7 speechProfileUsed:v9 recognizerModelInfo:0 isVoiceCommandCandidatePackage:v6];

    unsigned int v11 = [*(id *)(a1 + 32) _delegate];
    [v11 speechServiceDidRecognizeFinalResultCandidatePackage:v10];
  }
}

void sub_10001A1E4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      double v14 = "-[ESConnection speechRecognizer:didRecognizeVoiceCommandCandidatePackage:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(*(void *)(a1 + 32) + 144);
    BOOL v7 = [(id)qword_10005DA58 count] != 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    int v9 = [WeakRetained modelInfo];
    int v10 = +[CESRUtilities afSpeechPackageForEARPackage:v5 processedAudioDuration:v7 speechProfileUsed:v9 recognizerModelInfo:1 isVoiceCommandCandidatePackage:v6];

    unsigned int v11 = +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:*(void *)(a1 + 40)];
    int v12 = [*(id *)(a1 + 32) _delegate];
    [v12 speechServiceDidRecognizeVoiceCommandCandidatePackage:v10 withMetadata:v11];
  }
}

void sub_10001A390(id a1)
{
}

void sub_10001A3C4(id a1)
{
}

void sub_10001A4B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(*(void *)(a1 + 40) + 144);
  uint64_t v4 = [(id)qword_10005DA58 count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  double v6 = [WeakRetained modelInfo];
  id v15 = +[CESRUtilities afSpeechPackageForEARPackage:v2 processedAudioDuration:v4 speechProfileUsed:v6 recognizerModelInfo:1 isVoiceCommandCandidatePackage:v3];

  BOOL v7 = +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:*(void *)(a1 + 32)];
  __int16 v8 = [*(id *)(a1 + 40) _delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    int v9 = [*(id *)(a1 + 40) _delegate];
    [v9 speechServiceDidRecognizePartialPackage:v15 withMetadata:v7];
  }
  int v10 = *(void **)(a1 + 40);
  unsigned int v11 = [*(id *)(a1 + 32) recognition];
  int v12 = [v11 oneBest];
  int v13 = [*(id *)(a1 + 32) preITNRecognition];
  double v14 = [v13 oneBest];
  [v10 processPartialResultMetricsWithTokens:v12 preITNTokens:v14 timestamp:*(double *)(a1 + 48)];
}

void sub_10001A734(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tokens];
  id v10 = +[CESRUtilities afTokensForEARTokens:v2 removeSpaceBefore:0];

  double v3 = +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResult:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) enableVoiceCommands]
    && ([*(id *)(a1 + 48) _delegate],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    double v6 = [*(id *)(a1 + 48) _delegate];
    [v6 speechServiceDidRecognizeTokens:v10 withMetadata:v3];
  }
  else
  {
    double v6 = [*(id *)(a1 + 48) _delegate];
    [v6 speechServiceDidRecognizeTokens:v10];
  }

  BOOL v7 = *(void **)(a1 + 48);
  __int16 v8 = [*(id *)(a1 + 32) tokens];
  int v9 = [*(id *)(a1 + 32) preITNTokens];
  [v7 processPartialResultMetricsWithTokens:v8 preITNTokens:v9 timestamp:*(double *)(a1 + 56)];
}

uint64_t sub_10001AC04(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  double v6 = *(void **)(*(void *)(a1 + 32) + 344);
  if (v6)
  {
    uint64_t v17 = v5;
    BOOL v7 = (char *)[v6 count];
    if ((unint64_t)v7 <= a3)
    {
      __int16 v8 = v7;
      do
      {
        int v9 = *(void **)(*(void *)(a1 + 32) + 344);
        id v10 = +[NSMutableDictionary dictionary];
        [v9 addObject:v10];

        ++v8;
      }
      while ((unint64_t)v8 <= a3);
    }
    unsigned int v11 = [*(id *)(*(void *)(a1 + 32) + 344) objectAtIndex:a3];
    int v12 = [v17 tokenName];
    int v13 = +[CESRUtilities getNormString:v12];

    double v14 = [v11 objectForKey:v13];

    if (!v14)
    {
      id v15 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 320)];
      [v11 setObject:v15 forKey:v13];
    }
  }

  return _objc_release_x1();
}

id sub_10001AD50(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 tokenName];
  [v3 appendString:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 appendString:@" "];
}

void sub_10001AE54(uint64_t a1)
{
  uint64_t v2 = +[ESProfiler sharedProfiler];
  double v3 = [*(id *)(a1 + 32) _delegate];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v91 = a1;
  if ((v4 & 1) == 0) {
    goto LABEL_61;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(double *)(*(void *)(a1 + 32) + 144);
  BOOL v7 = [(id)qword_10005DA58 count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  int v9 = [WeakRetained modelInfo];
  id v10 = +[CESRUtilities afSpeechPackageForEARPackage:v5 processedAudioDuration:v7 speechProfileUsed:v9 recognizerModelInfo:0 isVoiceCommandCandidatePackage:v6];

  uint64_t v11 = v91;
  int v12 = [*(id *)(v91 + 32) _delegate];
  [v12 performSelector:"speechServiceDidProduceLoggablePackage:" withObject:v10];

  v89 = v2;
  id v90 = v10;
  if (v10 && *(void *)(*(void *)(v91 + 32) + 112))
  {
    uint64_t v13 = [v10 rawRecognition];
    double v14 = (void *)v13;
    if (v13)
    {
      uint64_t v88 = (void *)v13;
      id v15 = [*(id *)(*(void *)(v91 + 32) + 112) taskName];
      if (([v15 isEqualToString:@"Dictation"] & 1) == 0)
      {

LABEL_36:
        double v14 = v88;
        goto LABEL_37;
      }
      unsigned int v16 = [*(id *)(*(void *)(v91 + 32) + 112) applicationName];
      unsigned int v17 = [v16 isEqualToString:@"com.apple.MobileSMS"];

      double v14 = v88;
      if (v17)
      {
        id v18 = objc_alloc_init((Class)NSMutableArray);
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id obj = [v88 phrases];
        id v94 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
        if (v94)
        {
          uint64_t v93 = *(void *)v111;
          do
          {
            for (id i = 0; i != v94; id i = (char *)i + 1)
            {
              if (*(void *)v111 != v93) {
                objc_enumerationMutation(obj);
              }
              long long v20 = *(void **)(*((void *)&v110 + 1) + 8 * i);
              char v21 = [v20 interpretations];
              id v22 = [v21 count];

              if (v22)
              {
                id v96 = i;
                long long v108 = 0u;
                long long v109 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                id v23 = [v20 interpretations];
                id v24 = [v23 firstObject];
                uint64_t v25 = [v24 tokens];

                id v26 = [v25 countByEnumeratingWithState:&v106 objects:v120 count:16];
                if (!v26) {
                  goto LABEL_28;
                }
                id v27 = v26;
                uint64_t v28 = *(void *)v107;
                while (1)
                {
                  for (j = 0; j != v27; j = (char *)j + 1)
                  {
                    if (*(void *)v107 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    id v30 = *(void **)(*((void *)&v106 + 1) + 8 * (void)j);
                    id v31 = [v30 text];
                    if (([v31 hasSuffix:@"\\jit"] & 1) == 0)
                    {
                      int v33 = [v30 text];
                      if ([v33 hasSuffix:@"\\entity-first"])
                      {
                        uint64_t v34 = qword_10005DAA0;

                        if (!v34) {
                          continue;
                        }
LABEL_23:
                        id v31 = [v30 text];
                        [v18 addObject:v31];
                      }
                      else
                      {
                      }
                      continue;
                    }
                    uint64_t v32 = qword_10005DAA0;

                    if (v32) {
                      goto LABEL_23;
                    }
                  }
                  id v27 = [v25 countByEnumeratingWithState:&v106 objects:v120 count:16];
                  if (!v27)
                  {
LABEL_28:

                    id i = v96;
                    break;
                  }
                }
              }
            }
            id v94 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
          }
          while (v94);
        }

        if (qword_10005DAA0 && [v18 count])
        {
          int v35 = (void *)qword_10005DAA0;
          id v36 = [*(id *)(*(void *)(v91 + 32) + 112) interactionId];
          [v35 setObject:v18 forKey:v36];
        }
        uint64_t v11 = v91;
        goto LABEL_36;
      }
    }
LABEL_37:
  }
  double v37 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v115 = "-[ESConnection speechRecognizer:didProduceLoggablePackage:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Setting recognized text", buf, 0xCu);
  }
  double v38 = [*(id *)(v11 + 40) preITNRecognition];
  double v39 = [v38 nBest];

  CFStringRef v40 = [*(id *)(v11 + 40) recognition];
  v95 = [v40 nBest];

  unsigned int v41 = +[NSMutableArray array];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v97 = v39;
  id v42 = [v97 countByEnumeratingWithState:&v102 objects:v119 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v103;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(void *)v103 != v44) {
          objc_enumerationMutation(v97);
        }
        id v46 = *(void **)(*((void *)&v102 + 1) + 8 * (void)k);
        double v47 = +[NSMutableArray array];
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v48 = v46;
        id v49 = [v48 countByEnumeratingWithState:&v98 objects:v118 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v99;
          do
          {
            for (m = 0; m != v50; m = (char *)m + 1)
            {
              if (*(void *)v99 != v51) {
                objc_enumerationMutation(v48);
              }
              double v53 = [*(id *)(*((void *)&v98 + 1) + 8 * (void)m) tokenName];
              [v47 addObject:v53];
            }
            id v50 = [v48 countByEnumeratingWithState:&v98 objects:v118 count:16];
          }
          while (v50);
        }

        if ([v47 count]) {
          [v41 addObject:v47];
        }
      }
      id v43 = [v97 countByEnumeratingWithState:&v102 objects:v119 count:16];
    }
    while (v43);
  }

  double v54 = [v95 firstObject];
  int v55 = +[CESRUtilities earTokensToString:v54];

  if ([v41 count])
  {
    id v56 = (void *)qword_10005DA78;
    double v57 = [v41 firstObject];
    [v56 setRecognizedText:v57];

    [(id)qword_10005DA78 setRecognizedNbest:v41];
    [(id)qword_10005DA78 setPostITNRecognizedText:v55];
    double v58 = (void *)qword_10005DA98;
    if (qword_10005DA98)
    {
      double v59 = [v41 firstObject];
      [v58 setRecognizedTokens:v59];

      [(id)qword_10005DA98 setRecognizedNbest:v41];
      [(id)qword_10005DA98 setRecognizedText:v55];
      double v60 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v115 = "-[ESConnection speechRecognizer:didProduceLoggablePackage:]_block_invoke";
        __int16 v116 = 2112;
        v117 = v55;
        _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%s Set recognized text: %@", buf, 0x16u);
      }
    }
  }

  uint64_t v2 = v89;
  a1 = v91;
LABEL_61:
  uint64_t v61 = *(void *)(a1 + 40);
  v62 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v2 logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v61 loggableSharedUserId:0 timeInTicks:v62];

  double v63 = [*(id *)(a1 + 40) unrepairedRecognition];
  id v64 = [v63 oneBest];
  uint64_t v65 = +[CESRUtilities earTokensToString:v64];

  id v66 = [v2 selfHelper];
  [v66 setUnrepairedPostItn:v65];

  v67 = [*(id *)(a1 + 40) preITNRecognition];
  os_signpost_id_t v68 = [v67 oneBest];
  v69 = [v68 firstObject];

  if (v69)
  {
    [v69 silenceStart];
    double v71 = v70;
    [*(id *)(a1 + 40) utteranceStart];
    double v73 = v71 + v72;
    float v74 = v73;
    *(float *)&double v73 = v74;
    uint64_t v75 = [*(id *)(a1 + 32) _packetReadyUpstreamTimestampsFromAudioTime:v73];
    [v2 logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:v75];
    signed int v76 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      v84 = *(void **)(v91 + 32);
      v85 = v76;
      *(float *)&double v86 = v74;
      double v87 = [v84 _recordedTimestampFromAudioTime:v86];
      *(_DWORD *)buf = 136315394;
      v115 = "-[ESConnection speechRecognizer:didProduceLoggablePackage:]_block_invoke";
      __int16 v116 = 2112;
      v117 = v87;
      _os_log_debug_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "%s EmbeddedSpeechMetric: end of first word recorded in ticks (user-facing TTFW start): %@", buf, 0x16u);

      signed int v76 = AFSiriLogContextSpeech;
    }
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v115 = "-[ESConnection speechRecognizer:didProduceLoggablePackage:]_block_invoke";
      __int16 v116 = 2112;
      v117 = v75;
      _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "%s EmbeddedSpeechMetric: packet containing end of first word ready upstream in ticks (ASR-component TTFW start): %@", buf, 0x16u);
    }
    id v77 = objc_loadWeakRetained((id *)(*(void *)(v91 + 32) + 16));
    [v69 start];
    *(float *)&double v78 = v78;
    v79 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v77 packetArrivalTimestampFromAudioTime:v78]);

    [v2 logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:v79 loggableSharedUserId:0];
    id v80 = objc_loadWeakRetained((id *)(*(void *)(v91 + 32) + 16));
    [v69 start];
    double v82 = v81 + 1.0;
    *(float *)&double v82 = v82;
    dispatch_time_t v83 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v80 packetArrivalTimestampFromAudioTime:v82]);

    if ([v83 unsignedLongLongValue]) {
      [v2 logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:v83 loggableSharedUserId:0];
    }
  }
}

void sub_10001B9D4(uint64_t a1)
{
  uint64_t v2 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    int v10 = 136316674;
    uint64_t v11 = "-[ESConnection speechRecognizer:didProduceEndpointFeaturesWithWordCount:trailingSilenceDuration:eosLikelihood:"
          "pauseCounts:silencePosterior:processedAudioDurationInMilliseconds:acousticEndpointerScore:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s wordCount = %ld, trailingSilenceDuration = %ld, eosLikelihood = %f, pauseCounts = %@, silencePosterior = %f, acousticEndpointerScore = %f", (uint8_t *)&v10, 0x48u);
  }
  int v9 = [*(id *)(a1 + 40) _delegate];
  [v9 speechServiceDidProduceEndpointFeaturesWithWordCount:*(void *)(a1 + 48) trailingSilenceDuration:*(void *)(a1 + 56) eosLikelihood:*(void *)(a1 + 32) pauseCounts:*(void *)(a1 + 88) silencePosterior:*(double *)(a1 + 64) processedAudioDurationInMilliseconds:*(double *)(a1 + 72) acousticEndpointerScore:*(double *)(a1 + 80)];
}

id sub_10001BCC8(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 saveOneRecordPerDay];
  }
  else {
    return [v2 save];
  }
}

void sub_10001C298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C2B8(uint64_t result)
{
  return result;
}

void sub_10001CDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CDFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001CE0C(uint64_t a1)
{
}

uint64_t sub_10001CE14(void *a1)
{
  uint64_t v2 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v3;
    __int16 v23 = 2112;
    uint64_t v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Starting model compilation for the primary %@ asset: %@, using config at path: %@", buf, 0x2Au);
  }
  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = +[_EARSpeechRecognizer compileRecognizerModels2WithConfiguration:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    int v9 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Finished model compilation for the primary %@ asset: %@", buf, 0x20u);
    }
  }
  else
  {
    __int16 v12 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = a1[4];
      uint64_t v16 = a1[5];
      uint64_t v17 = *(void *)(*(void *)(a1[9] + 8) + 40);
      *(_DWORD *)buf = 136315906;
      __int16 v20 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s Model compilation failed for the primary %@ asset: %@, error: %@", buf, 0x2Au);
    }
  }
  uint64_t v13 = a1[8];
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, *(void *)(*(void *)(a1[9] + 8) + 40));
  }
  return xpc_transaction_exit_clean();
}

void sub_10001D614(uint64_t a1)
{
  uint64_t v7 = 0;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10001CDFC;
  uint64_t v11 = sub_10001CE0C;
  id v12 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D730;
  v4[3] = &unk_100051308;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = &v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v8[5]);
  }
  xpc_transaction_exit_clean();

  _Block_object_dispose(&v7, 8);
}

void sub_10001D718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001D730(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[ESConnection compileAllAssetsWithType:completion:]_block_invoke_2";
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Starting model compilation for %@ asset: %@, using config at path: %@", buf, 0x2Au);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v11 + 40);
  unsigned __int8 v12 = +[_EARSpeechRecognizer compileRecognizerModels2WithConfiguration:v8 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    uint64_t v13 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[ESConnection compileAllAssetsWithType:completion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Finished model compilation for %@ asset: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v15 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      __int16 v20 = "-[ESConnection compileAllAssetsWithType:completion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s Model compilation failed for %@ asset: %@, error: %@", buf, 0x2Au);
    }
    *a4 = 1;
  }
}

void sub_10001DC90(uint64_t a1)
{
  uint64_t v2 = +[ESAssetManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v13 = 0;
  unsigned __int8 v5 = [v2 purgeInstalledAssetsExceptLanguages:v3 assetType:v4 error:&v13];
  id v6 = v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001DD7C;
  v9[3] = &unk_1000512B8;
  id v7 = *(id *)(a1 + 40);
  unsigned __int8 v12 = v5;
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

uint64_t sub_10001DD7C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void sub_10001DE60(uint64_t a1)
{
  uint64_t v2 = +[ESAssetManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = 0;
  unsigned int v4 = [v2 purgeInstalledAssetsExceptLanguages:v3 assetType:3 error:&v15];
  id v5 = v15;

  id v6 = &off_100054168;
  if (v4) {
    id v6 = &off_100054150;
  }
  id v7 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001DF80;
  v11[3] = &unk_100051290;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v7;
  id v9 = v5;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t sub_10001DF80(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void sub_10001E148(uint64_t a1)
{
  v376 = (uint64_t (*)(uint64_t, uint64_t))objc_alloc_init((Class)NSMutableDictionary);
  id v346 = objc_alloc_init((Class)NSMutableDictionary);
  id v349 = objc_alloc_init((Class)NSMutableDictionary);
  id v358 = objc_alloc_init((Class)NSMutableDictionary);
  id v351 = objc_alloc_init((Class)NSMutableDictionary);
  v494[0] = @"corrected";
  v494[1] = @"recognized";
  int v1 = +[NSArray arrayWithObjects:v494 count:2];
  v392 = +[NSSet setWithArray:v1];

  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"evaluations"];
  v345 = v2;
  if (![v2 count] || (unint64_t)objc_msgSend(v2, "count") > 0xA)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 0;
    goto LABEL_339;
  }
  long long v463 = 0u;
  long long v462 = 0u;
  long long v461 = 0u;
  long long v460 = 0u;
  id obj = v2;
  char v5 = 0;
  char v6 = 0;
  id v7 = [obj countByEnumeratingWithState:&v460 objects:v493 count:16];
  if (!v7)
  {
LABEL_21:

    id v340 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:*(void *)(a1 + 40) assetType:3];
    uint64_t v19 = +[ESAssetManager sharedInstance];
    id v455 = 0;
    id v391 = [v19 installedQuasarModelPathForAssetConfig:v340 error:&v455];
    v318 = (uint64_t (*)(uint64_t, uint64_t))v455;

    v334 = [v391 stringByAppendingPathComponent:@"mini.json"];
    v322 = [v391 stringByAppendingPathComponent:@"ncs"];
    id v20 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v334];
    v315 = [v20 version];

    __int16 v21 = AFSiriLogContextFides;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedL"
                           "MPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v391;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s modelRoot: %@", buf, 0x16u);
    }

    if (![v391 length]
      || (+[CESRUtilities isFilePathValid:v334] & 1) == 0)
    {
      uint64_t v32 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalize"
                             "dLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v497 = v318;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s No modelRoot for %@: %@", buf, 0x20u);
      }

      if (v318)
      {
        NSErrorUserInfoKey v488 = NSUnderlyingErrorKey;
        v489 = v318;
        int v33 = +[NSDictionary dictionaryWithObjects:&v489 forKeys:&v488 count:1];
      }
      else
      {
        int v33 = 0;
      }
      uint64_t v34 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v33];
      if (v318) {

      }
      v376 = 0;
      unsigned int v4 = (void *)v34;
LABEL_337:

      id obj = v318;
      uint64_t v3 = v376;

      goto LABEL_338;
    }
    uint64_t v482 = 0;
    v483 = &v482;
    uint64_t v484 = 0x3032000000;
    v485 = sub_10001CDFC;
    v486 = sub_10001CE0C;
    id v487 = 0;
    uint64_t v449 = 0;
    v450 = &v449;
    uint64_t v451 = 0x3032000000;
    v452 = sub_10001CDFC;
    v453 = sub_10001CE0C;
    id v454 = 0;
    uint64_t v22 = qword_10005D9E8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002225C;
    block[3] = &unk_100051240;
    block[4] = *(void *)(a1 + 48);
    v447 = &v449;
    id v320 = v340;
    id v444 = v320;
    id v445 = &__NSDictionary0__struct;
    id v321 = v391;
    id v446 = v321;
    v448 = &v482;
    dispatch_sync(v22, block);
    if (!v450[5])
    {

      uint64_t v35 = v483[5];
      if (v35)
      {
        NSErrorUserInfoKey v480 = NSUnderlyingErrorKey;
        uint64_t v481 = v35;
        id v36 = +[NSDictionary dictionaryWithObjects:&v481 forKeys:&v480 count:1];
      }
      else
      {
        id v36 = 0;
      }
      v338 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v36];
      v376 = 0;
      LODWORD(v38) = 1;
      id v350 = &__NSDictionary0__struct;
      if (!v35) {
        goto LABEL_274;
      }
      goto LABEL_273;
    }
    if ((v6 & 1) == 0)
    {
      id v311 = 0;
      uint64_t v37 = 0;
LABEL_64:
      uint64_t v343 = v37;
      if (v5)
      {
        id v50 = [v322 stringByAppendingPathComponent:@"en_US_napg.json"];
        uint64_t v51 = [v322 stringByAppendingPathComponent:@"vocdelta.voc"];
        double v52 = [v322 stringByAppendingPathComponent:@"pg.voc"];
        double v53 = [v322 stringByAppendingPathComponent:@"mrec.psh"];
        LOBYTE(v310) = 1;
        id v327 = [objc_alloc((Class)_EARUserProfile) initWithConfiguration:v334 language:*(void *)(a1 + 40) overrides:&__NSDictionary0__struct sdapiOverrides:v50 emptyVoc:v51 pgVoc:v52 paramsetHolder:v53 isJit:v310];
      }
      else
      {
        id v327 = 0;
      }
      double v54 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"wordConfidenceThreshold"];
      id v55 = [v54 integerValue];
      if (v55) {
        uint64_t v56 = (uint64_t)v55;
      }
      else {
        uint64_t v56 = 500;
      }

      double v57 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"utteranceConfidenceThreshold"];
      id v58 = [v57 integerValue];
      if (v58) {
        uint64_t v59 = (uint64_t)v58;
      }
      else {
        uint64_t v59 = 500;
      }

      double v60 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"scoreNbest"];
      unsigned int v347 = [v60 BOOLValue];

      uint64_t v61 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"compress"];
      unsigned int v312 = [v61 BOOLValue];

      uint64_t v436 = 0;
      v437 = (double *)&v436;
      uint64_t v438 = 0x3032000000;
      v439 = sub_10001CDFC;
      v440 = sub_10001CE0C;
      id v441 = 0;
      v62 = *(void **)(a1 + 48);
      double v63 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      v435[0] = _NSConcreteStackBlock;
      v435[1] = 3221225472;
      v435[2] = sub_1000223D0;
      v435[3] = &unk_1000511C8;
      v435[4] = &v436;
      [v62 readProfileAndUserDataWithLanguage:v63 allowOverride:0 completion:v435];

      id v64 = v437;
      if (*((void *)v437 + 5)) {
        goto LABEL_79;
      }
      uint64_t v65 = AFSiriLogContextFides;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalize"
                             "dLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke_2";
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%s Failed to load old type of speech profile. Trying new type.", buf, 0xCu);
      }

      id v66 = +[CESRUtilities speechProfilePathsWithLanguage:*(void *)(a1 + 40)];
      if ([v66 count] == (id)1)
      {
        id v67 = objc_alloc((Class)NSData);
        os_signpost_id_t v68 = [v66 firstObject];
        id v69 = [v67 initWithContentsOfFile:v68 options:0 error:0];
        double v70 = (void *)*((void *)v437 + 5);
        *((void *)v437 + 5) = v69;
      }
      id v64 = v437;
      if (*((void *)v437 + 5))
      {
LABEL_79:
        double v71 = AFSiriLogContextFides;
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
LABEL_82:

          long long v434 = 0u;
          long long v433 = 0u;
          long long v432 = 0u;
          long long v431 = 0u;
          id v319 = *(id *)(a1 + 72);
          id v38 = [v319 countByEnumeratingWithState:&v431 objects:v478 count:16];
          if (!v38)
          {
            v338 = 0;
            id v350 = &__NSDictionary0__struct;
            goto LABEL_270;
          }
          v338 = 0;
          uint64_t v326 = *(void *)v432;
          uint64_t v336 = kAFAssistantErrorDomain;
          double v396 = (double)v56;
          uint64_t v314 = EARRecognitionStatisticRecogCpuTime;
          uint64_t v316 = EARRecognitionStatisticAverageActiveTokensPerFrame;
          id v350 = &__NSDictionary0__struct;
          while (1)
          {
            uint64_t v76 = 0;
            id v328 = v38;
            do
            {
              if (*(void *)v432 != v326) {
                objc_enumerationMutation(v319);
              }
              uint64_t v342 = v76;
              uint64_t v335 = *(void *)(*((void *)&v431 + 1) + 8 * v76);
              id v77 = objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:");
              log = +[CESRFidesASRRecord recordFromData:v77];

              double v78 = AFSiriLogContextFides;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPer"
                                     "sonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = log;
                _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s Examining localSpeechDESRecord: %@", buf, 0x16u);
              }

              if (!log)
              {
                log = AFSiriLogContextSpeech;
                if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesP"
                                       "ersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
                  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Unable to load localSpeechDESRecord", buf, 0xCu);
                }
                goto LABEL_241;
              }
              v79 = [log concatenatedAudioPackets];
              if (![v79 length])
              {
                v254 = v79;
                v255 = AFSiriLogContextSpeech;
                if (os_log_type_enabled(v255, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesP"
                                       "ersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
                  _os_log_error_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_ERROR, "%s Unable to load audio", buf, 0xCu);
                }

                goto LABEL_241;
              }
              id v80 = [log task];
              v339 = v79;
              double v81 = [(id)v450[5] modelInfo];
              id v430 = 0;
              v348 = sub_1000223E0(v81, v80, &v430);
              v324 = v80;
              v323 = (uint64_t (*)(uint64_t, uint64_t))v430;

              if (!v348)
              {
                v256 = AFSiriLogContextFides;
                if (os_log_type_enabled(v256, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesP"
                                       "ersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v80;
                  *(_WORD *)&buf[22] = 2112;
                  v497 = v323;
                  _os_log_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_INFO, "%s Recognizer doesn't support the task %{public}@: %@", buf, 0x20u);
                }

LABEL_241:
                goto LABEL_266;
              }
              id v330 = objc_alloc_init((Class)NSMutableDictionary);
              id v333 = objc_alloc_init((Class)NSMutableDictionary);
              id v329 = objc_alloc_init((Class)NSMutableDictionary);
              id v325 = objc_alloc_init((Class)NSMutableDictionary);
              long long v429 = 0u;
              long long v428 = 0u;
              long long v427 = 0u;
              long long v426 = 0u;
              v374 = obj;
              id v353 = [v374 countByEnumeratingWithState:&v426 objects:v477 count:16];
              if (v353)
              {
                uint64_t v352 = *(void *)v427;
                do
                {
                  v388 = 0;
                  do
                  {
                    if (*(void *)v427 != v352) {
                      objc_enumerationMutation(v374);
                    }
                    uint64_t v82 = *(void *)(*((void *)&v426 + 1) + 8 * (void)v388);
                    if ([*(id *)(a1 + 48) _invalidated])
                    {
                      v257 = AFSiriLogContextFides;
                      if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:"
                                             "fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:comple"
                                             "tion:]_block_invoke";
                        _os_log_impl((void *)&_mh_execute_header, v257, OS_LOG_TYPE_INFO, "%s Interrupted evaluation redecoding", buf, 0xCu);
                      }

                      NSErrorUserInfoKey v475 = NSLocalizedDescriptionKey;
                      CFStringRef v476 = @"Interrupted evaluation redecoding";
                      uint64_t v258 = +[NSDictionary dictionaryWithObjects:&v476 forKeys:&v475 count:1];
                      id v112 = +[NSError errorWithDomain:v336 code:1503 userInfo:v258];
                      v394 = (void *)v258;
                      v259 = v338;
                      goto LABEL_251;
                    }
                    if (([v392 containsObject:v82] & 1) == 0)
                    {
                      dispatch_time_t v83 = AFSiriLogContextFides;
                      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:"
                                             "fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:comple"
                                             "tion:]_block_invoke";
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v82;
                        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%s Running recognition for evalName: %@", buf, 0x16u);
                      }
                      uint64_t v377 = v82;

                      v394 = [v374 objectForKeyedSubscript:v82];
                      id v379 = objc_alloc_init((Class)NSMutableDictionary);
                      uint64_t v84 = [v394 objectForKeyedSubscript:@"overrides"];
                      v85 = (void *)v84;
                      if (v84) {
                        double v86 = (void *)v84;
                      }
                      else {
                        double v86 = &__NSDictionary0__struct;
                      }
                      [v379 addEntriesFromDictionary:v86];

                      double v87 = [v394 objectForKeyedSubscript:@"overrideFiles"];
                      uint64_t v88 = *(void **)(a1 + 80);
                      id v89 = v87;
                      id v383 = v88;
                      v371 = v89;
                      if (v89 && [v89 count])
                      {
                        id v90 = objc_alloc_init((Class)NSMutableDictionary);
                        long long v501 = 0u;
                        long long v502 = 0u;
                        memset(v500, 0, sizeof(v500));
                        id v91 = v89;
                        id v92 = [v91 countByEnumeratingWithState:v500 objects:buf count:16];
                        if (v92)
                        {
                          uint64_t v93 = **(void **)&v500[16];
                          while (2)
                          {
                            for (id i = 0; i != v92; id i = (char *)i + 1)
                            {
                              if (**(void **)&v500[16] != v93) {
                                objc_enumerationMutation(v91);
                              }
                              uint64_t v95 = *(void *)(*(void *)&v500[8] + 8 * i);
                              id v96 = [v91 objectForKeyedSubscript:v95];
                              id v97 = sub_1000225C4(v383, v96);

                              if (!v97
                                || ([v97 path],
                                    long long v98 = objc_claimAutoreleasedReturnValue(),
                                    BOOL v99 = [v98 length] == 0,
                                    v98,
                                    v99))
                              {
                                NSErrorUserInfoKey v495 = NSLocalizedDescriptionKey;
                                v503 = @"Override file is not found in attachments or device";
                                long long v102 = +[NSDictionary dictionaryWithObjects:&v503 forKeys:&v495 count:1];
                                id v101 = +[NSError errorWithDomain:v336 code:1501 userInfo:v102];

                                id v366 = 0;
                                goto LABEL_118;
                              }
                              long long v100 = [v97 path];
                              [v90 setObject:v100 forKeyedSubscript:v95];
                            }
                            id v92 = [v91 countByEnumeratingWithState:v500 objects:buf count:16];
                            if (v92) {
                              continue;
                            }
                            break;
                          }
                        }

                        id v366 = v90;
                        id v101 = 0;
LABEL_118:
                      }
                      else
                      {
                        id v101 = 0;
                        id v366 = 0;
                      }

                      id v103 = v101;
                      if (v103)
                      {
                        v260 = AFSiriLogContextFides;
                        if (os_log_type_enabled(v260, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315394;
                          *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachment"
                                               "s:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:co"
                                               "mpletion:]_block_invoke";
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = v103;
                          _os_log_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_INFO, "%s Failed to get override files, error: %@", buf, 0x16u);
                        }

                        id v261 = v103;
                        id v368 = v366;
                        id v112 = v261;

LABEL_248:
                        v376 = 0;
                        v262 = v368;
LABEL_250:

                        v259 = v379;
LABEL_251:

                        char v263 = 0;
                        LODWORD(v38) = 1;
                        v338 = v112;
                        goto LABEL_265;
                      }
                      if (v366) {
                        long long v104 = v366;
                      }
                      else {
                        long long v104 = &__NSDictionary0__struct;
                      }
                      [v379 addEntriesFromDictionary:v104];
                      if (([v350 isEqual:v379] & 1) == 0)
                      {
                        id v105 = v379;

                        long long v106 = AFSiriLogContextFides;
                        if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315394;
                          *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachment"
                                               "s:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:co"
                                               "mpletion:]_block_invoke";
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = v105;
                          _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, "%s Creating recognizer with overrides: %@", buf, 0x16u);
                        }

                        long long v107 = (void *)v450[5];
                        v450[5] = 0;

                        long long v108 = qword_10005D9E8;
                        v419[0] = _NSConcreteStackBlock;
                        v419[1] = 3221225472;
                        v419[2] = sub_100022730;
                        v419[3] = &unk_100051240;
                        v424 = &v449;
                        id v420 = v320;
                        id v350 = v105;
                        id v421 = v350;
                        id v109 = v321;
                        uint64_t v110 = *(void *)(a1 + 48);
                        id v422 = v109;
                        uint64_t v423 = v110;
                        v425 = &v482;
                        dispatch_sync(v108, v419);
                        uint64_t v111 = v450[5];
                        if (v111)
                        {
                          id v112 = v338;
                        }
                        else
                        {

                          uint64_t v113 = v483[5];
                          if (v113)
                          {
                            NSErrorUserInfoKey v473 = NSUnderlyingErrorKey;
                            uint64_t v474 = v113;
                            v317 = +[NSDictionary dictionaryWithObjects:&v474 forKeys:&v473 count:1];
                            v114 = v317;
                          }
                          else
                          {
                            v114 = 0;
                          }
                          id v112 = +[NSError errorWithDomain:v336 code:600 userInfo:v114];

                          if (v113) {
                          v376 = 0;
                          }
                        }

                        if (!v111)
                        {
                          id v261 = 0;
                          id v379 = v350;
                          v262 = v366;
                          goto LABEL_250;
                        }
                        v338 = v112;
                      }
                      [(id)v450[5] setScoreNbest:v347];
                      if (v343
                        && ([v394 objectForKeyedSubscript:@"usePersonalizedLM"],
                            v115 = objc_claimAutoreleasedReturnValue(),
                            unsigned int v116 = [v115 BOOLValue],
                            v115,
                            v116))
                      {
                        v117 = AFSiriLogContextFides;
                        if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315138;
                          *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachment"
                                               "s:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:co"
                                               "mpletion:]_block_invoke_2";
                          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_INFO, "%s Using Personalized LM", buf, 0xCu);
                        }

                        [(id)v450[5] setExtraLmList:v343];
                        if (v347) {
                          [(id)v450[5] setScoreNbestExtraLmList:&__NSArray0__struct];
                        }
                      }
                      else
                      {
                        v118 = AFSiriLogContextFides;
                        if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315138;
                          *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachment"
                                               "s:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:co"
                                               "mpletion:]_block_invoke";
                          _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "%s Not using Personalized LM", buf, 0xCu);
                        }

                        [(id)v450[5] setExtraLmList:&__NSArray0__struct];
                        if (v347) {
                          [(id)v450[5] setScoreNbestExtraLmList:v343];
                        }
                      }
                      [(id)v450[5] setEnableSpeakerCodeTraining:0];
                      id v119 = *((id *)v437 + 5);
                      v120 = [v394 objectForKeyedSubscript:@"restoreAOT"];
                      unsigned int v121 = [v120 BOOLValue];

                      if (!v121
                        || ([log profile],
                            uint64_t v122 = objc_claimAutoreleasedReturnValue(),
                            v119,
                            (id v119 = (id)v122) != 0))
                      {
                        v123 = [v394 objectForKeyedSubscript:@"disableAOT"];
                        unsigned int v124 = [v123 BOOLValue];

                        if (v124)
                        {

                          id v119 = 0;
                        }
                        id v372 = objc_alloc_init((Class)NSMutableDictionary);
                        v125 = [v394 objectForKeyedSubscript:@"useJIT"];
                        unsigned int v126 = [v125 BOOLValue];

                        if (!v126)
                        {
                          v165 = 0;
                          goto LABEL_177;
                        }
                        v127 = AFSiriLogContextFides;
                        if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315138;
                          *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachment"
                                               "s:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:co"
                                               "mpletion:]_block_invoke";
                          _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_INFO, "%s Using JIT LME", buf, 0xCu);
                        }

                        __int16 v128 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"contextualData"];
                        double v129 = *(void **)(a1 + 80);
                        __int16 v130 = [log applicationName];
                        [log timestamp];
                        double v132 = v131;
                        id v359 = v327;
                        id v133 = v129;
                        id v134 = v130;
                        id v362 = v348;
                        id v368 = v119;
                        id v384 = v372;
                        id v135 = v128;
                        v136 = [v135 objectForKeyedSubscript:@"restoreJIT"];
                        double v137 = 0.0;
                        if ([v136 BOOLValue])
                        {
                          v138 = +[NSDate date];
                          [v138 timeIntervalSince1970];
                          double v140 = v139;

                          double v137 = v140 - v132;
                        }

                        v141 = [v135 objectForKeyedSubscript:@"configurationFile"];

                        if (v327)
                        {
                          if (v133 && [v133 count] && objc_msgSend(v141, "length"))
                          {
                            v142 = sub_1000225C4(v133, v141);
                            v143 = v142;
                            if (!v142
                              || ([v142 path],
                                  v144 = objc_claimAutoreleasedReturnValue(),
                                  BOOL v145 = [v144 length] == 0,
                                  v144,
                                  v145))
                            {
                              *(void *)v500 = NSLocalizedDescriptionKey;
                              *(void *)buf = @"JIT LME: configuration file is not found in attachments or device";
                              id v241 = +[NSDictionary dictionaryWithObjects:buf forKeys:v500 count:1];
                              id v168 = +[NSError errorWithDomain:v336 code:1501 userInfo:v241];
                              id v169 = 0;
                            }
                            else
                            {
                              v146 = [ESContextualData alloc];
                              v147 = [v143 path];
                              v148 = [(ESContextualData *)v146 initWithConfiguration:v147 taskName:v362 applicationName:v134];

                              v149 = +[NSProcessInfo processInfo];
                              [v149 systemUptime];
                              double v151 = v150;

                              if (!v148
                                || ([(ESContextualData *)v148 contextualData],
                                    v152 = objc_claimAutoreleasedReturnValue(),
                                    BOOL v153 = v152 == 0,
                                    v152,
                                    v153))
                              {
                                v158 = 0;
                              }
                              else
                              {
                                [(ESContextualData *)v148 fetchNamedEntitiesWithTimeInterval:v137];
                                v154 = +[NSProcessInfo processInfo];
                                [v154 systemUptime];
                                double v156 = v155;

                                v157 = [(ESContextualData *)v148 contextualData];
                                v158 = [v359 createInlineLmeUserDataForContextData:v157 speechProfile:v368];

                                v159 = +[NSProcessInfo processInfo];
                                [v159 systemUptime];
                                double v161 = v160;

                                if (v384)
                                {
                                  v162 = +[NSNumber numberWithDouble:(v156 - v151) * 1000.0];
                                  [v384 setObject:v162 forKeyedSubscript:@"jitQueryDurationInMs"];

                                  v163 = +[NSNumber numberWithDouble:(v161 - v156) * 1000.0];
                                  [v384 setObject:v163 forKeyedSubscript:@"jitLmeDurationInMs"];

                                  v164 = [(ESContextualData *)v148 metrics];
                                  [v384 setObject:v164 forKeyedSubscript:@"jitDataStats"];
                                }
                              }
                              id v241 = v158;

                              id v168 = 0;
                              id v169 = v241;
                            }

LABEL_171:
                            id v170 = v168;

                            if (v169)
                            {
                              v171 = AFSiriLogContextFides;
                              if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 136315394;
                                *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:atta"
                                                     "chments:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:sc"
                                                     "rubResult:completion:]_block_invoke";
                                *(_WORD *)&buf[12] = 2112;
                                *(void *)&buf[14] = v384;
                                _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_INFO, "%s JIT LME: Injecting JIT data, jitStats: %@", buf, 0x16u);
                              }
                            }
                            else if (v170)
                            {
                              v265 = AFSiriLogContextFides;
                              if (os_log_type_enabled(v265, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 136315394;
                                *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:atta"
                                                     "chments:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:sc"
                                                     "rubResult:completion:]_block_invoke";
                                *(_WORD *)&buf[12] = 2112;
                                *(void *)&buf[14] = v170;
                                _os_log_impl((void *)&_mh_execute_header, v265, OS_LOG_TYPE_INFO, "%s JIT LME: Error fetching JIT data, error: %@", buf, 0x16u);
                              }

                              id v112 = v170;
                              id v261 = v366;

                              goto LABEL_248;
                            }

                            v165 = v169;
LABEL_177:
                            v341 = v165;
                            objc_msgSend((id)v450[5], "setJitProfileData:");
                            v172 = (void *)v450[5];
                            v173 = *(void **)(a1 + 40);
                            id v385 = [log samplingRate];
                            id v363 = v172;
                            v369 = v119;
                            id v360 = v339;
                            id v355 = v173;
                            id v356 = v348;
                            id v174 = objc_alloc_init((Class)NSMutableArray);
                            id v175 = objc_alloc_init((Class)NSMutableDictionary);
                            v176 = +[NSProcessInfo processInfo];
                            [v176 systemUptime];
                            double v332 = v177;

                            v354 = [v363 recognitionResultsWithAudioData:v360 userProfileData:v369 language:v355 task:v356 samplingRate:v385 extraLanguageModel:0];
                            v178 = +[NSProcessInfo processInfo];
                            [v178 systemUptime];
                            double v331 = v179;

                            if (v354)
                            {
                              v180 = [v354 firstObject];
                              id v344 = [v180 tokens];

                              id v337 = [v344 count];
                              if (v337)
                              {
                                long long v501 = 0u;
                                long long v502 = 0u;
                                memset(v500, 0, sizeof(v500));
                                id v181 = v344;
                                id v182 = [v181 countByEnumeratingWithState:v500 objects:buf count:16];
                                if (v182)
                                {
                                  uint64_t v183 = **(void **)&v500[16];
                                  double v184 = 0.0;
                                  double v185 = -10000.0;
                                  double v186 = 10000.0;
                                  double v187 = 0.0;
                                  double v188 = 0.0;
                                  double v189 = 0.0;
                                  do
                                  {
                                    for (j = 0; j != v182; j = (char *)j + 1)
                                    {
                                      if (**(void **)&v500[16] != v183) {
                                        objc_enumerationMutation(v181);
                                      }
                                      v191 = *(void **)(*(void *)&v500[8] + 8 * (void)j);
                                      [v191 confidence];
                                      double v193 = v192;
                                      v194 = [v191 tokenName];
                                      [v174 addObject:v194];

                                      v195 = [v191 tokenName];
                                      BOOL v196 = [v195 rangeOfString:@"\\""] == (id)0x7FFFFFFFFFFFFFFFLL;

                                      if (!v196) {
                                        double v187 = v187 + 1.0;
                                      }
                                      [v191 confidence];
                                      if (v197 < v186)
                                      {
                                        [v191 confidence];
                                        double v186 = v198;
                                      }
                                      [v191 confidence];
                                      if (v199 > v185)
                                      {
                                        [v191 confidence];
                                        double v185 = v200;
                                      }
                                      [v191 confidence];
                                      double v189 = v189 + v193;
                                      double v188 = v188 + 1.0;
                                      if (v201 > v396) {
                                        double v184 = v184 + 1.0;
                                      }
                                    }
                                    id v182 = [v181 countByEnumeratingWithState:v500 objects:buf count:16];
                                  }
                                  while (v182);
                                }
                                else
                                {
                                  double v184 = 0.0;
                                  double v185 = -10000.0;
                                  double v186 = 10000.0;
                                  double v187 = 0.0;
                                  double v188 = 0.0;
                                  double v189 = 0.0;
                                }

                                v206 = +[NSNumber numberWithDouble:v188];
                                [v175 setObject:v206 forKey:@"UtteranceLength"];

                                v207 = +[NSNumber numberWithDouble:v187];
                                [v175 setObject:v207 forKey:@"NumberOfNonTerminals"];

                                v208 = +[NSNumber numberWithDouble:v186];
                                [v175 setObject:v208 forKey:@"ConfidenceMin"];

                                v209 = +[NSNumber numberWithDouble:v185];
                                [v175 setObject:v209 forKey:@"ConfidenceMax"];

                                v210 = +[NSNumber numberWithDouble:v184];
                                [v175 setObject:v210 forKey:@"WordsAboveThreshold"];

                                v211 = +[NSNumber numberWithDouble:v189 / (double)(unint64_t)v337];
                                [v175 setObject:v211 forKey:@"ConfidenceMean"];

                                v212 = [v363 recognitionStatistics];
                                double v213 = 0.0;
                                if (v189 / (double)(unint64_t)v337 >= (double)v59) {
                                  double v213 = 1.0;
                                }
                                v214 = +[NSNumber numberWithDouble:v213];
                                [v175 setObject:v214 forKey:@"UtteranceAboveThreshold"];

                                if (v385)
                                {
                                  double v215 = (double)((unint64_t)[v360 length] >> 1)
                                       / (double)(unint64_t)v385;
                                  if (v215 * 1000.0 != 0.0)
                                  {
                                    v216 = [v212 objectForKey:v314];
                                    [v216 doubleValue];
                                    double v218 = v217;

                                    v219 = +[NSNumber numberWithDouble:v218 / (v215 * 1000.0)];
                                    [v175 setObject:v219 forKey:@"RTF"];

                                    v220 = +[NSNumber numberWithDouble:(v331 - v332) / v215];
                                    [v175 setObject:v220 forKey:@"WallRTF"];

                                    v221 = +[NSNumber numberWithDouble:v331 - v332];
                                    [v175 setObject:v221 forKey:@"DecodeDuration"];
                                  }
                                }
                                v222 = [v212 objectForKey:v316];
                                [v175 setValue:v222 forKey:@"AverageActiveTokensPerFrame"];
                              }
                              else
                              {
                                [v175 setObject:@"Empty recognition Result" forKey:@"Error"];
                              }
                              id v204 = v174;
                              id v205 = v344;
                              id v386 = v175;
                              id v203 = 0;
                              v202 = v205;
                            }
                            else
                            {
                              *(void *)v500 = NSLocalizedFailureReasonErrorKey;
                              *(void *)buf = @"Recipe evaluation failed";
                              v202 = +[NSDictionary dictionaryWithObjects:buf forKeys:v500 count:1];
                              id v203 = +[NSError errorWithDomain:v336 code:1108 userInfo:v202];
                              id v204 = 0;
                              id v205 = 0;
                              id v386 = 0;
                            }

                            v364 = (uint64_t (*)(uint64_t, uint64_t))v203;
                            id v223 = v204;
                            id v361 = v205;
                            v357 = [(id)v450[5] recognitionUtterenceStatistics];
                            [(id)v450[5] cancelRecognition];
                            if (!v364 && v386 && v223 && v361)
                            {
                              v224 = objc_alloc_init((Class)NSMutableDictionary);
                              v225 = [v386 objectForKeyedSubscript:@"WallRTF"];
                              [v224 setObject:v225 forKeyedSubscript:@"WallRTF"];

                              v226 = [v386 objectForKeyedSubscript:@"DecodeDuration"];
                              [v224 setObject:v226 forKeyedSubscript:@"DecodeDuration"];

                              v227 = [v386 objectForKeyedSubscript:@"AverageActiveTokensPerFrame"];
                              [v224 setObject:v227 forKeyedSubscript:@"AverageActiveTokensPerFrame"];

                              v228 = [v357 objectForKeyedSubscript:@"lm_interp_weights"];
                              [v224 setObject:v228 forKeyedSubscript:@"lm_interp_weights"];

                              v229 = [v372 objectForKeyedSubscript:@"jitQueryDurationInMs"];
                              [v224 setObject:v229 forKeyedSubscript:@"jitQueryDurationInMs"];

                              v230 = [v372 objectForKeyedSubscript:@"jitLmeDurationInMs"];
                              [v224 setObject:v230 forKeyedSubscript:@"jitLmeDurationInMs"];

                              v231 = [v372 objectForKeyedSubscript:@"jitDataStats"];
                              [v224 setObject:v231 forKeyedSubscript:@"jitDataStats"];

                              [v330 setObject:v224 forKeyedSubscript:v377];
                              [v333 setObject:v223 forKeyedSubscript:v377];
                              id v232 = v361;
                              v233 = +[CESRUtilities afTokensForEARTokens:v232 removeSpaceBefore:0];
                              id v234 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v232, "count"));
                              long long v501 = 0u;
                              long long v502 = 0u;
                              memset(v500, 0, sizeof(v500));
                              id v235 = v233;
                              id v236 = [v235 countByEnumeratingWithState:v500 objects:buf count:16];
                              if (v236)
                              {
                                uint64_t v237 = **(void **)&v500[16];
                                do
                                {
                                  for (k = 0; k != v236; k = (char *)k + 1)
                                  {
                                    if (**(void **)&v500[16] != v237) {
                                      objc_enumerationMutation(v235);
                                    }
                                    v239 = [*(id *)(*(void *)&v500[8] + 8 * (void)k) dictionaryRepresentation];
                                    [v234 addObject:v239];
                                  }
                                  id v236 = [v235 countByEnumeratingWithState:v500 objects:buf count:16];
                                }
                                while (v236);
                              }

                              [v329 setObject:v234 forKeyedSubscript:v377];
                              v240 = [(id)v450[5] recognitionUtteranceInfos];
                              [v325 setObject:v240 forKeyedSubscript:v377];
                            }
                            else
                            {
                              v224 = AFSiriLogContextFides;
                              if (os_log_type_enabled(v224, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 136315650;
                                *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:atta"
                                                     "chments:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:sc"
                                                     "rubResult:completion:]_block_invoke";
                                *(_WORD *)&buf[12] = 2112;
                                *(void *)&buf[14] = v377;
                                *(_WORD *)&buf[22] = 2112;
                                v497 = v364;
                                _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_INFO, "%s No results for evalName %@: %@", buf, 0x20u);
                              }
                            }

                            v167 = v369;
LABEL_220:

                            goto LABEL_221;
                          }
                          *(void *)v500 = NSLocalizedDescriptionKey;
                          *(void *)buf = @"JIT LME: required configuration/file is missing";
                          v143 = +[NSDictionary dictionaryWithObjects:buf forKeys:v500 count:1];
                          id v166 = +[NSError errorWithDomain:v336 code:1501 userInfo:v143];
                        }
                        else
                        {
                          *(void *)v500 = NSLocalizedDescriptionKey;
                          *(void *)buf = @"JIT LME: JIT profile builder is not initialized";
                          v143 = +[NSDictionary dictionaryWithObjects:buf forKeys:v500 count:1];
                          id v166 = +[NSError errorWithDomain:v336 code:1501 userInfo:v143];
                        }
                        id v168 = v166;
                        id v169 = 0;
                        goto LABEL_171;
                      }
                      v167 = AFSiriLogContextFides;
                      if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:"
                                             "fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:comple"
                                             "tion:]_block_invoke";
                        _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "%s Unable to restore speech profile", buf, 0xCu);
                      }
                      goto LABEL_220;
                    }
LABEL_221:
                    v388 = (char *)v388 + 1;
                  }
                  while (v388 != v353);
                  id v242 = [v374 countByEnumeratingWithState:&v426 objects:v477 count:16];
                  id v353 = v242;
                }
                while (v242);
              }

              v243 = [log recognizedText];
              [v333 setObject:v243 forKeyedSubscript:@"recognized"];

              [v349 setObject:v333 forKeyedSubscript:v335];
              [v358 setObject:v329 forKeyedSubscript:v335];
              v244 = [log correctedTextV2];
              [v351 setObject:v244 forKeyedSubscript:v335];

              v374 = (uint64_t (*)(uint64_t, uint64_t))objc_alloc_init((Class)NSMutableDictionary);
              v245 = [log interactionIdentifier];
              [v374 setObject:v245 forKeyedSubscript:@"interactionId"];

              v246 = [log asrSelfComponentIdentifier];
              [v374 setObject:v246 forKeyedSubscript:@"asrSelfComponentId"];

              [v374 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"language"];
              [v374 setObject:v315 forKeyedSubscript:@"asset"];
              v247 = [log applicationName];
              [v374 setObject:v247 forKeyedSubscript:@"applicationName"];

              [log timestamp];
              v248 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v374 setObject:v248 forKeyedSubscript:@"timestamp"];

              [v374 setObject:v330 forKeyedSubscript:@"metrics"];
              if (!*(unsigned char *)(a1 + 96))
              {
                if (v312)
                {
                  *(void *)v500 = 0;
                  v249 = +[NSJSONSerialization dataWithJSONObject:v325 options:0 error:v500];
                  id v250 = *(id *)v500;
                  if (v249)
                  {
                    v503 = 0;
                    v251 = [v249 compressedDataUsingAlgorithm:3 error:&v503];
                    v252 = v503;
                    if (v251)
                    {
                      v253 = [v251 base64EncodedStringWithOptions:0];
                    }
                    else
                    {
                      v266 = AFSiriLogContextSpeech;
                      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)&uint8_t buf[4] = "zlibCompressedJson";
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v252;
                        _os_log_error_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_ERROR, "%s Compression failed: %@", buf, 0x16u);
                      }
                      v253 = 0;
                    }
                  }
                  else
                  {
                    v264 = AFSiriLogContextSpeech;
                    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)&uint8_t buf[4] = "zlibCompressedJson";
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v250;
                      _os_log_error_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_ERROR, "%s JSON serialization failed: %@", buf, 0x16u);
                    }
                    v253 = 0;
                  }

                  [v374 setObject:v253 forKeyedSubscript:@"uttInfosCompressed"];
                }
                else
                {
                  [v374 setObject:v325 forKeyedSubscript:@"uttInfos"];
                }
              }
              [v346 setObject:v374 forKeyedSubscript:v335];
              LODWORD(v38) = 0;
              char v263 = 1;
LABEL_265:

              if ((v263 & 1) == 0) {
                goto LABEL_270;
              }
LABEL_266:
              uint64_t v76 = v342 + 1;
            }
            while ((id)(v342 + 1) != v328);
            id v38 = [v319 countByEnumeratingWithState:&v431 objects:v478 count:16];
            if (!v38)
            {
LABEL_270:

              _Block_object_dispose(&v436, 8);
              goto LABEL_272;
            }
          }
        }
        id v72 = [*((id *)v64 + 5) length];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalize"
                             "dLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v72;
        double v73 = "%s Loaded speech profile: %lu bytes";
        float v74 = v71;
        uint32_t v75 = 22;
      }
      else
      {
        double v71 = AFSiriLogContextFides;
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_INFO)) {
          goto LABEL_82;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalize"
                             "dLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
        double v73 = "%s Unable to load speech profile";
        float v74 = v71;
        uint32_t v75 = 12;
      }
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, v73, buf, v75);
      goto LABEL_82;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v497 = sub_10001CDFC;
    v498 = sub_10001CE0C;
    id v499 = 0;
    uint64_t v23 = *(void *)(a1 + 56);
    id v24 = AFSiriLogContextFides;
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v25)
      {
        uint64_t v26 = *(void *)(a1 + 56);
        uint64_t v27 = *(void *)(a1 + 64);
        *(_DWORD *)v500 = 136315650;
        *(void *)&v500[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonaliz"
                              "edLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke_2";
        *(_WORD *)&v500[12] = 2112;
        *(void *)&v500[14] = v26;
        *(_WORD *)&v500[22] = 2112;
        *(void *)&v500[24] = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Attempting to load Fides-trained Personalized LM fidesPersonalizedLMPath=%@ fidesPersonalizedLMTrainingAsset=%@", v500, 0x20u);
      }

      if ([*(id *)(a1 + 64) isEqualToString:v315])
      {
        id v311 = [objc_alloc((Class)_EARLmModel) initFromDirectory:*(void *)(a1 + 56)];
        uint64_t v28 = [v311 handle];
        id v29 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v28;

LABEL_53:
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          uint64_t v44 = AFSiriLogContextFides;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v500 = 136315138;
            *(void *)&v500[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPerson"
                                  "alizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke_2";
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Loaded Personalized LM", v500, 0xCu);
          }

          uint64_t v479 = *(void *)(*(void *)&buf[8] + 40);
          char v45 = 1;
          uint64_t v343 = +[NSArray arrayWithObjects:&v479 count:1];
        }
        else
        {
          id v46 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"personalizedLM"];
          double v47 = [v46 objectForKeyedSubscript:@"require"];
          unsigned int v48 = [v47 BOOLValue];

          if (v48)
          {
            id v49 = AFSiriLogContextFides;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v500 = 136315138;
              *(void *)&v500[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPers"
                                    "onalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s Required Personalized LM not found", v500, 0xCu);
            }

            [v376 setObject:@"Required Personalized LM not found" forKeyedSubscript:@"status"];
            uint64_t v343 = 0;
            char v45 = 0;
          }
          else
          {
            uint64_t v343 = 0;
            char v45 = 1;
          }
        }
        _Block_object_dispose(buf, 8);

        if (v45)
        {
          uint64_t v37 = v343;
          goto LABEL_64;
        }
        v338 = 0;
        LODWORD(v38) = 1;
        id v350 = &__NSDictionary0__struct;
LABEL_272:

        id v36 = (void *)v343;
LABEL_273:

LABEL_274:
        _Block_object_dispose(&v449, 8);

        _Block_object_dispose(&v482, 8);
        if (v38) {
          goto LABEL_336;
        }
        v267 = AFSiriLogContextFides;
        if (os_log_type_enabled(v267, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonali"
                               "zedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_INFO, "%s Tokenizing correctedText", buf, 0xCu);
        }

        long long v417 = 0u;
        long long v418 = 0u;
        long long v415 = 0u;
        long long v416 = 0u;
        id v268 = v346;
        id v269 = 0;
        id v270 = [v268 countByEnumeratingWithState:&v415 objects:v472 count:16];
        if (v270)
        {
          uint64_t v271 = *(void *)v416;
          while (2)
          {
            for (m = 0; m != v270; m = (char *)m + 1)
            {
              if (*(void *)v416 != v271) {
                objc_enumerationMutation(v268);
              }
              uint64_t v273 = *(void *)(*((void *)&v415 + 1) + 8 * (void)m);
              if ([*(id *)(a1 + 48) _invalidated])
              {
                v278 = AFSiriLogContextFides;
                if (os_log_type_enabled(v278, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesP"
                                       "ersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
                  _os_log_impl((void *)&_mh_execute_header, v278, OS_LOG_TYPE_INFO, "%s Interrupted evaluation tokenization", buf, 0xCu);
                }

                NSErrorUserInfoKey v470 = NSLocalizedDescriptionKey;
                CFStringRef v471 = @"Interrupted evaluation tokenization";
                v274 = +[NSDictionary dictionaryWithObjects:&v471 forKeys:&v470 count:1];
                uint64_t v279 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v274];

                goto LABEL_293;
              }
              v274 = [v351 objectForKeyedSubscript:v273];
              if (v274)
              {
                if (!v269)
                {
                  id v269 = [objc_alloc((Class)_EARQuasarTokenizer) initWithModelRoot:v321];
                  if (!v269)
                  {
                    v306 = AFSiriLogContextFides;
                    if (os_log_type_enabled(v306, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v309 = *(void *)(a1 + 40);
                      *(_DWORD *)buf = 136315394;
                      *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fi"
                                           "desPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v309;
                      _os_log_error_impl((void *)&_mh_execute_header, v306, OS_LOG_TYPE_ERROR, "%s No tokenizer for %@", buf, 0x16u);
                    }

                    v307 = +[NSString stringWithFormat:@"No tokenizer for %@", *(void *)(a1 + 40)];

                    NSErrorUserInfoKey v468 = NSLocalizedDescriptionKey;
                    v469 = v307;
                    v308 = +[NSDictionary dictionaryWithObjects:&v469 forKeys:&v468 count:1];
                    uint64_t v279 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v308];

                    id v269 = 0;
                    v376 = 0;

LABEL_293:
                    int v277 = 0;
                    v338 = (void *)v279;
                    goto LABEL_294;
                  }
                }
                v275 = [v269 tokenize:v274];
                v276 = [v349 objectForKeyedSubscript:v273];
                [v276 setObject:v275 forKeyedSubscript:@"corrected"];
              }
            }
            id v270 = [v268 countByEnumeratingWithState:&v415 objects:v472 count:16];
            if (v270) {
              continue;
            }
            break;
          }
        }
        int v277 = 1;
LABEL_294:

        if (!v277)
        {
LABEL_336:
          unsigned int v4 = v338;
        }
        else
        {
          v280 = AFSiriLogContextFides;
          if (os_log_type_enabled(v280, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersona"
                                 "lizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_INFO, "%s Computing alignments", buf, 0xCu);
          }

          long long v413 = 0u;
          long long v414 = 0u;
          long long v411 = 0u;
          long long v412 = 0u;
          id v375 = v268;
          id v281 = [v375 countByEnumeratingWithState:&v411 objects:v467 count:16];
          if (v281)
          {
            uint64_t v367 = *(void *)v412;
            do
            {
              uint64_t v282 = 0;
              id v365 = v281;
              do
              {
                if (*(void *)v412 != v367) {
                  objc_enumerationMutation(v375);
                }
                uint64_t v283 = *(void *)(*((void *)&v411 + 1) + 8 * v282);
                v373 = [v375 objectForKeyedSubscript:v283];
                uint64_t v370 = v282;
                v398 = [v349 objectForKeyedSubscript:v283];
                id v284 = objc_alloc_init((Class)NSMutableDictionary);
                long long v409 = 0u;
                long long v410 = 0u;
                long long v407 = 0u;
                long long v408 = 0u;
                os_log_t loga = obj;
                id v380 = [loga countByEnumeratingWithState:&v407 objects:v466 count:16];
                if (v380)
                {
                  uint64_t v378 = *(void *)v408;
                  do
                  {
                    for (n = 0; n != v380; n = (char *)n + 1)
                    {
                      if (*(void *)v408 != v378) {
                        objc_enumerationMutation(loga);
                      }
                      uint64_t v285 = *(void *)(*((void *)&v407 + 1) + 8 * (void)n);
                      v395 = [v398 objectForKeyedSubscript:v285];
                      if (v395)
                      {
                        v286 = [loga objectForKeyedSubscript:v285];
                        long long v405 = 0u;
                        long long v406 = 0u;
                        long long v403 = 0u;
                        long long v404 = 0u;
                        v387 = v286;
                        v287 = [v286 objectForKeyedSubscript:@"alignmentReferences"];
                        id v288 = [v287 countByEnumeratingWithState:&v403 objects:v465 count:16];
                        if (v288)
                        {
                          uint64_t v289 = *(void *)v404;
                          do
                          {
                            for (iid i = 0; ii != v288; iid i = (char *)ii + 1)
                            {
                              if (*(void *)v404 != v289) {
                                objc_enumerationMutation(v287);
                              }
                              uint64_t v291 = *(void *)(*((void *)&v403 + 1) + 8 * (void)ii);
                              v292 = [v398 objectForKeyedSubscript:v291];
                              v293 = v292;
                              if (v292)
                              {
                                v294 = sub_100022818(v292, v395, 1);
                                if (v294)
                                {
                                  v295 = [v284 objectForKeyedSubscript:v285];
                                  BOOL v296 = v295 == 0;

                                  if (v296)
                                  {
                                    id v297 = objc_alloc_init((Class)NSMutableDictionary);
                                    [v284 setObject:v297 forKeyedSubscript:v285];
                                  }
                                  v298 = [v284 objectForKeyedSubscript:v285];
                                  [v298 setObject:v294 forKeyedSubscript:v291];
                                }
                              }
                            }
                            id v288 = [v287 countByEnumeratingWithState:&v403 objects:v465 count:16];
                          }
                          while (v288);
                        }
                      }
                    }
                    id v380 = [loga countByEnumeratingWithState:&v407 objects:v466 count:16];
                  }
                  while (v380);
                }

                [v373 setObject:v284 forKeyedSubscript:@"alignments"];
                uint64_t v282 = v370 + 1;
              }
              while ((id)(v370 + 1) != v365);
              id v281 = [v375 countByEnumeratingWithState:&v411 objects:v467 count:16];
            }
            while (v281);
          }

          if (!*(unsigned char *)(a1 + 96))
          {
            long long v401 = 0u;
            long long v402 = 0u;
            long long v399 = 0u;
            long long v400 = 0u;
            id v299 = v375;
            id v300 = [v299 countByEnumeratingWithState:&v399 objects:v464 count:16];
            if (v300)
            {
              uint64_t v301 = *(void *)v400;
              do
              {
                for (jj = 0; jj != v300; jj = (char *)jj + 1)
                {
                  if (*(void *)v400 != v301) {
                    objc_enumerationMutation(v299);
                  }
                  uint64_t v303 = *(void *)(*((void *)&v399 + 1) + 8 * (void)jj);
                  v304 = [v358 objectForKeyedSubscript:v303];
                  [v304 setObject:0 forKeyedSubscript:@"corrected"];
                  [v304 setObject:0 forKeyedSubscript:@"recognized"];
                  v305 = [v299 objectForKeyedSubscript:v303];
                  [v305 setObject:v304 forKeyedSubscript:@"tokens"];
                }
                id v300 = [v299 countByEnumeratingWithState:&v399 objects:v464 count:16];
              }
              while (v300);
            }
          }
          unsigned int v4 = v338;
          [v376 setObject:v375 forKeyedSubscript:@"results"];
        }
        goto LABEL_337;
      }
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)v500 = 136315138;
        *(void *)&v500[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonaliz"
                              "edLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Attempting to load user's Personalized LM", v500, 0xCu);
      }

      *(void *)v500 = 0;
      *(void *)&v500[8] = v500;
      *(void *)&v500[16] = 0x2020000000;
      *(_DWORD *)&v500[24] = 0;
      uint64_t v436 = 0;
      v437 = (double *)&v436;
      uint64_t v438 = 0x2020000000;
      v439 = 0;
      v442[0] = _NSConcreteStackBlock;
      v442[1] = 3221225472;
      v442[2] = sub_100022354;
      v442[3] = &unk_100051218;
      uint64_t v40 = *(void *)(a1 + 48);
      v442[5] = buf;
      v442[4] = v40;
      v442[6] = &v449;
      v442[7] = v500;
      v442[8] = &v436;
      dispatch_sync((dispatch_queue_t)qword_10005D9E8, v442);
      LODWORD(v41) = *(_DWORD *)(*(void *)&v500[8] + 24);
      id v42 = +[NSNumber numberWithFloat:v41];
      [v376 setObject:v42 forKeyedSubscript:@"personalizedLMWeight"];

      id v43 = +[NSNumber numberWithDouble:v437[3]];
      [v376 setObject:v43 forKeyedSubscript:@"personalizedLMAge"];

      _Block_object_dispose(&v436, 8);
      _Block_object_dispose(v500, 8);
    }
    id v311 = 0;
    goto LABEL_53;
  }
  uint64_t v8 = *(void *)v461;
LABEL_6:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v461 != v8) {
      objc_enumerationMutation(obj);
    }
    id v340 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v460 + 1) + 8 * v9)];
    long long v459 = 0u;
    long long v458 = 0u;
    long long v457 = 0u;
    long long v456 = 0u;
    id v10 = [v340 objectForKeyedSubscript:@"alignmentReferences"];
    id v11 = [v10 countByEnumeratingWithState:&v456 objects:v492 count:16];
    id v391 = v10;
    if (v11) {
      break;
    }
LABEL_19:

    uint64_t v16 = [v340 objectForKeyedSubscript:@"usePersonalizedLM"];
    unsigned __int8 v17 = [(id)v16 BOOLValue];

    __int16 v18 = [v340 objectForKeyedSubscript:@"useJIT"];
    LOBYTE(v16) = [v18 BOOLValue];

    v6 |= v17;
    v5 |= v16;
    if ((id)++v9 == v7)
    {
      id v7 = [obj countByEnumeratingWithState:&v460 objects:v493 count:16];
      if (!v7) {
        goto LABEL_21;
      }
      goto LABEL_6;
    }
  }
  uint64_t v12 = *(void *)v457;
LABEL_11:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v457 != v12) {
      objc_enumerationMutation(v391);
    }
    uint64_t v14 = *(void *)(*((void *)&v456 + 1) + 8 * v13);
    id v15 = [obj objectForKeyedSubscript:v14];
    if (!v15) {
      break;
    }

LABEL_17:
    if (v11 == (id)++v13)
    {
      id v11 = [v391 countByEnumeratingWithState:&v456 objects:v492 count:16];
      if (!v11) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
  }
  if ([v392 containsObject:v14]) {
    goto LABEL_17;
  }
  id v30 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedLMP"
                         "ath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Unknown evaluation name found in alignmentReferences: %@", buf, 0x16u);
  }
  v334 = +[NSString stringWithFormat:@"Unknown evaluation name found in alignmentReferences: %@", v14];

  NSErrorUserInfoKey v490 = NSLocalizedDescriptionKey;
  v491 = v334;
  id v31 = +[NSDictionary dictionaryWithObjects:&v491 forKeys:&v490 count:1];
  unsigned int v4 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1501 userInfo:v31];
  uint64_t v3 = 0;

LABEL_338:
  v376 = obj;
LABEL_339:

  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

void sub_100021D28(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55)
{
  if (a2)
  {
    id v56 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      id v57 = v56;
      id v58 = AFSiriLogContextFides;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        LODWORD(STACK[0xA80]) = 136315394;
        STACK[0xA84] = (unint64_t)"-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fide"
                                         "sPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
        LOWORD(STACK[0xA8C]) = 2112;
        STACK[0xA8E] = (unint64_t)v57;
        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s Exception evaluating recipe: %@", (uint8_t *)&STACK[0xA80], 0x16u);
      }

      STACK[0x678] = (unint64_t)@"name";
      uint64_t v59 = [v57 name];
      STACK[0x690] = (unint64_t)v59;
      STACK[0x680] = (unint64_t)@"callStackReturnAddresses";
      double v60 = [v57 callStackReturnAddresses];
      STACK[0x698] = (unint64_t)v60;
      STACK[0x688] = (unint64_t)@"callStackSymbols";
      uint64_t v61 = [v57 callStackSymbols];
      STACK[0x6A0] = (unint64_t)v61;
      v62 = +[NSDictionary dictionaryWithObjects:&STACK[0x690] forKeys:&STACK[0x678] count:3];
      double v63 = +[NSMutableDictionary dictionaryWithDictionary:v62];

      id v64 = [v57 reason];

      if (v64)
      {
        uint64_t v65 = [v57 reason];
        [v63 setObject:v65 forKeyedSubscript:@"reason"];
      }
      id v66 = [v57 userInfo];

      if (v66)
      {
        id v67 = [v57 userInfo];
        [v63 setObject:v67 forKeyedSubscript:@"userInfo"];
      }
      id v68 = objc_alloc((Class)NSError);
      [v68 initWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v63];

      objc_end_catch();
    }
    else
    {
      id v69 = AFSiriLogContextFides;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        LODWORD(STACK[0xA80]) = 136315138;
        STACK[0xA84] = (unint64_t)"-[ESConnection runEvaluationWithDESRecordDatas:language:recipe:attachments:fide"
                                         "sPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke";
        _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%s Unknown exception evaluating recipe", (uint8_t *)&STACK[0xA80], 0xCu);
      }

      id v70 = objc_alloc((Class)NSError);
      [v70 initWithDomain:kAFAssistantErrorDomain code:1503 userInfo:&off_100054290];

      objc_end_catch();
    }
    JUMPOUT(0x100021AF4);
  }
  _Unwind_Resume(a1);
}

void *sub_10002225C(void *result)
{
  if (!*(unsigned char *)(result[4] + 96))
  {
    int v1 = result;
    uint64_t v2 = result[5];
    uint64_t v3 = result[6];
    unsigned int v4 = +[NSURL fileURLWithPath:result[7]];
    char v5 = *(unsigned char *)(v1[4] + 26);
    uint64_t v6 = *(void *)(v1[9] + 8);
    id obj = *(id *)(v6 + 40);
    BYTE1(v10) = v5;
    LOBYTE(v10) = 0;
    uint64_t v7 = +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:](ESConnection, "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:", v2, 0, 0, v3, v4, 1, 0, v10, 0, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    uint64_t v8 = *(void *)(v1[8] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    return objc_storeWeak((id *)(v1[4] + 272), *(id *)(*(void *)(v1[8] + 8) + 40));
  }
  return result;
}

uint64_t sub_100022354(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) personalizedLMWithTask:@"Dictation" applicationName:@"com.apple.MobileSMS" recognizer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) weightOut:*(void *)(*(void *)(a1 + 56) + 8) + 24 ageOut:*(void *)(*(void *)(a1 + 64) + 8) + 24];

  return _objc_release_x1();
}

void sub_1000223D0(uint64_t a1, void *a2)
{
}

void *sub_1000223E0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 tasks];
  id v8 = v6;
  if ([v7 containsObject:v8])
  {
    uint64_t v9 = v8;
LABEL_6:
    a3 = v9;
    uint64_t v12 = v9;
    goto LABEL_10;
  }
  if ([v8 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation])
  {
    uint64_t v10 = (void *)CoreEmbeddedSpeechRecognizerTaskDictation;
    if ([v7 containsObject:CoreEmbeddedSpeechRecognizerTaskDictation])
    {
      id v11 = v10;

      uint64_t v9 = v11;
      goto LABEL_6;
    }
  }
  if (a3)
  {
    uint64_t v13 = kAFAssistantErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
    uint64_t v14 = [v5 language];
    id v15 = +[NSString stringWithFormat:@"Task %@ not available for %@, supported tasks are %@", v8, v14, v7];
    uint64_t v19 = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    *a3 = +[NSError errorWithDomain:v13 code:1113 userInfo:v16];

    a3 = 0;
  }
  uint64_t v12 = v8;
LABEL_10:

  return a3;
}

id sub_1000225C4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && [v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (id i = 0; i != v7; id i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "lastPathComponent", (void)v14);
          unsigned __int8 v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_14;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id sub_100022730(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = +[NSURL fileURLWithPath:a1[6]];
  char v5 = *(unsigned char *)(a1[7] + 26);
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  BYTE1(v11) = v5;
  LOBYTE(v11) = 0;
  uint64_t v7 = +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:](ESConnection, "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:", v2, 0, 0, v3, v4, 1, 0, v11, 0, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[8] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return objc_storeWeak((id *)(a1[7] + 272), *(id *)(*(void *)(a1[8] + 8) + 40));
}

id sub_100022818(void *a1, void *a2, int a3)
{
  id v4 = a1;
  id v61 = a2;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v4 count] != (id)-1)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_alloc_init(ESAlignmentState);
      [(ESAlignmentState *)v8 setNumberOfInsertions:0];
      [(ESAlignmentState *)v8 setNumberOfSubstitutions:0];
      [(ESAlignmentState *)v8 setNumberOfDeletions:v7];
      [(ESAlignmentState *)v8 setTotalCost:v7];
      [v5 addObject:v8];
      uint64_t v9 = objc_alloc_init(ESAlignmentState);
      [v6 addObject:v9];

      ++v7;
    }
    while (v7 < (unint64_t)[v4 count] + 1);
  }
  id v62 = 0;
  uint64_t v59 = +[NSRegularExpression regularExpressionWithPattern:@"\\\\\\S*$" options:0 error:&v62];
  id v51 = v62;
  id v58 = v4;
  if ([v61 count])
  {
    unint64_t v52 = 1;
    double v54 = v5;
    id v55 = v6;
    do
    {
      uint64_t v10 = [v5 objectAtIndexedSubscript:0];
      id v11 = [v10 copy];
      [v6 setObject:v11 atIndexedSubscript:0];

      unsigned __int8 v12 = [v6 objectAtIndexedSubscript:0];
      [v12 incrementInsertions];

      uint64_t v13 = [v6 objectAtIndexedSubscript:0];
      [v13 incrementCost];

      if ([v4 count])
      {
        unint64_t v14 = 1;
        do
        {
          long long v15 = [v5 objectAtIndexedSubscript:v14];
          long long v16 = (char *)[v15 totalCost];

          long long v17 = [v6 objectAtIndexedSubscript:v14 - 1];
          NSErrorUserInfoKey v18 = (char *)[v17 totalCost];

          uint64_t v19 = [v5 objectAtIndexedSubscript:v14 - 1];
          id v20 = (char *)[v19 totalCost];

          __int16 v21 = [v61 objectAtIndexedSubscript:v52 - 1];
          uint64_t v22 = [v4 objectAtIndexedSubscript:v14 - 1];
          if (a3)
          {
            uint64_t v23 = [v21 lowercaseString];

            uint64_t v24 = [v22 lowercaseString];

            __int16 v21 = (void *)v23;
            uint64_t v22 = (void *)v24;
          }
          BOOL v25 = objc_msgSend(v59, "stringByReplacingMatchesInString:options:range:withTemplate:", v21, 0, 0, objc_msgSend(v21, "length"), &stru_1000519F0);

          uint64_t v26 = objc_msgSend(v59, "stringByReplacingMatchesInString:options:range:withTemplate:", v22, 0, 0, objc_msgSend(v22, "length"), &stru_1000519F0);

          uint64_t v27 = &v20[[v25 isEqualToString:v26] ^ 1];
          if ((uint64_t)v27 > (uint64_t)v16 || (uint64_t)v27 > (uint64_t)v18)
          {
            id v5 = v54;
            if ((uint64_t)v18 >= (uint64_t)v16)
            {
              uint64_t v35 = [v54 objectAtIndexedSubscript:v14];
              id v36 = [v35 copy];
              id v6 = v55;
              [v55 setObject:v36 atIndexedSubscript:v14];

              uint64_t v37 = [v55 objectAtIndexedSubscript:v14];
              [v37 setTotalCost:v16 + 1];

              id v31 = [v55 objectAtIndexedSubscript:v14];
              [v31 incrementInsertions];
            }
            else
            {
              id v6 = v55;
              uint64_t v32 = [v55 objectAtIndexedSubscript:v14 - 1];
              id v33 = [v32 copy];
              [v55 setObject:v33 atIndexedSubscript:v14];

              uint64_t v34 = [v55 objectAtIndexedSubscript:v14];
              [v34 setTotalCost:v18 + 1];

              id v31 = [v55 objectAtIndexedSubscript:v14];
              [v31 incrementDeletions];
            }
          }
          else
          {
            id v5 = v54;
            uint64_t v28 = [v54 objectAtIndexedSubscript:v14 - 1];
            id v29 = [v28 copy];
            id v6 = v55;
            [v55 setObject:v29 atIndexedSubscript:v14];

            if (([v25 isEqualToString:v26] & 1) == 0)
            {
              id v30 = [v55 objectAtIndexedSubscript:v14];
              [v30 incrementSubstitutions];
            }
            id v31 = [v55 objectAtIndexedSubscript:v14];
            [v31 setTotalCost:v27];
          }

          ++v14;
          id v4 = v58;
        }
        while (v14 <= (unint64_t)[v58 count]);
      }
      if ([v5 count])
      {
        unint64_t v38 = 0;
        do
        {
          uint64_t v39 = [v6 objectAtIndexedSubscript:v38];
          id v40 = [v39 copy];
          [v5 setObject:v40 atIndexedSubscript:v38];

          ++v38;
        }
        while (v38 < (unint64_t)[v5 count]);
      }
      ++v52;
    }
    while (v52 <= (unint64_t)[v61 count]);
  }
  if ([v5 count])
  {
    double v41 = (char *)[v5 count] - 1;
    v63[0] = @"Insertions";
    id v42 = [v5 objectAtIndexedSubscript:v41];
    double v60 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 numberOfInsertions]);
    v64[0] = v60;
    v63[1] = @"Deletions";
    id v57 = [v5 objectAtIndexedSubscript:v41];
    double v53 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v57 numberOfDeletions]);
    v64[1] = v53;
    v63[2] = @"Substitutions";
    id v43 = [v5 objectAtIndexedSubscript:v41];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v43 numberOfSubstitutions]);
    v45 = uint64_t v44 = v5;
    v64[2] = v45;
    v63[3] = @"EditDistance";
    id v46 = [v44 objectAtIndexedSubscript:v41];
    double v47 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v46 totalCost]);
    v64[3] = v47;
    v63[4] = @"ReferenceSize";
    id v4 = v58;
    unsigned int v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v58 count]);
    v64[4] = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:5];

    id v5 = v44;
  }
  else
  {
    v65[0] = @"Insertions";
    v65[1] = @"Deletions";
    v66[0] = &off_100054168;
    v66[1] = &off_100054168;
    v65[2] = @"Substitutions";
    v65[3] = @"EditDistance";
    v66[2] = &off_100054168;
    v66[3] = &off_100054168;
    v65[4] = @"ReferenceSize";
    id v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    v66[4] = v42;
    id v49 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:5];
  }

  return v49;
}

void sub_1000234D4(void *a1)
{
  uint64_t v146 = 0;
  v147 = &v146;
  uint64_t v148 = 0x3032000000;
  v149 = sub_10001CDFC;
  double v150 = sub_10001CE0C;
  id v151 = 0;
  id v2 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:a1[4] task:0];
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = sub_10001CDFC;
  v144 = sub_10001CE0C;
  id v145 = 0;
  uint64_t v3 = qword_10005D9E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002482C;
  block[3] = &unk_1000511A0;
  v138 = &v140;
  id v4 = v2;
  uint64_t v5 = a1[5];
  id v96 = v4;
  id v136 = v4;
  uint64_t v137 = v5;
  double v139 = &v146;
  dispatch_sync(v3, block);
  if (v141[5])
  {
    id v105 = a1;
    id v6 = +[ESAssetManager sharedInstance];
    unint64_t v7 = (id *)(v147 + 5);
    id obj = (id)v147[5];
    uint64_t v95 = [v6 installedQuasarModelPathForAssetConfig:v96 error:&obj];
    objc_storeStrong(v7, obj);

    id v8 = [objc_alloc((Class)_EARQuasarTokenizer) initWithModelRoot:v95];
    if (v8)
    {
      id v97 = +[NSMutableArray array];
      *(void *)id v169 = 0;
      *(void *)&v169[8] = v169;
      *(void *)&v169[16] = 0x3032000000;
      id v170 = sub_10001CDFC;
      v171 = sub_10001CE0C;
      id v172 = 0;
      uint64_t v9 = (void *)v105[5];
      uint64_t v10 = [(id)v105[4] stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472;
      v133[2] = sub_1000248B0;
      v133[3] = &unk_1000511C8;
      v133[4] = v169;
      [v9 readProfileAndUserDataWithLanguage:v10 allowOverride:0 completion:v133];

      uint64_t v11 = *(void *)&v169[8];
      if (*(void *)(*(void *)&v169[8] + 40)) {
        goto LABEL_9;
      }
      unsigned __int8 v12 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:c"
                             "aseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke_2";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Failed to load old type of speech profile. Trying new type.", buf, 0xCu);
      }
      uint64_t v13 = +[CESRUtilities speechProfilePathsWithLanguage:v105[4]];
      if ([v13 count] == (id)1)
      {
        id v14 = objc_alloc((Class)NSData);
        long long v15 = [v13 firstObject];
        id v16 = [v14 initWithContentsOfFile:v15 options:0 error:0];
        long long v17 = *(void **)(*(void *)&v169[8] + 40);
        *(void *)(*(void *)&v169[8] + 40) = v16;
      }
      uint64_t v11 = *(void *)&v169[8];
      if (*(void *)(*(void *)&v169[8] + 40))
      {
LABEL_9:
        NSErrorUserInfoKey v18 = AFSiriLogContextFides;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [*(id *)(v11 + 40) length];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate"
                               ":caseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Loaded speech profile: %lu bytes", buf, 0x16u);
        }

        id v20 = v105;
      }
      else
      {
        v85 = AFSiriLogContextFides;
        id v20 = v105;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate"
                               ":caseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s Unable to load speech profile", buf, 0xCu);
        }
      }
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v98 = (id)v20[6];
      id v21 = [v98 countByEnumeratingWithState:&v129 objects:v168 count:16];
      if (!v21)
      {
LABEL_81:

        v152[0] = @"modelVersion";
        uint32_t v75 = [(id)v141[5] modelInfo];
        uint64_t v76 = [v75 version];
        v152[1] = @"results";
        v153[0] = v76;
        v153[1] = v97;
        id v98 = +[NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:2];

        (*(void (**)(void))(v105[9] + 16))();
        goto LABEL_89;
      }
      uint64_t v99 = *(void *)v130;
LABEL_14:
      uint64_t v104 = 0;
      while (1)
      {
        if (*(void *)v130 != v99) {
          objc_enumerationMutation(v98);
        }
        uint64_t v22 = *(void *)(*((void *)&v129 + 1) + 8 * v104);
        if ([(id)v105[5] _invalidated]) {
          break;
        }
        uint64_t v23 = [(id)v105[6] objectForKeyedSubscript:v22];
        long long v106 = +[CESRFidesASRRecord recordFromData:v23];

        uint64_t v24 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate"
                               ":caseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v106;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Examining localSpeechDESRecord: %@", buf, 0x16u);
        }
        if (v106)
        {
          id v101 = [(id)v105[7] objectForKeyedSubscript:v22];
          if (v101)
          {
            long long v102 = objc_opt_new();
            id v103 = [v106 recognizedText];
            BOOL v25 = [v106 correctedText];
            long long v100 = [v8 tokenize:v25];

            if (v103 && [v103 count] && v100 && objc_msgSend(v100, "count"))
            {
              uint64_t v26 = [v106 task];
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              v163 = sub_10001CDFC;
              v164 = sub_10001CE0C;
              id v165 = 0;
              uint64_t v27 = qword_10005D9E8;
              v120[0] = _NSConcreteStackBlock;
              v120[1] = 3221225472;
              v120[2] = sub_1000248C0;
              v120[3] = &unk_100051150;
              v125 = buf;
              unsigned int v126 = &v140;
              id v121 = (id)v105[7];
              uint64_t v122 = v22;
              v127 = v169;
              id v123 = (id)v105[4];
              id v28 = v26;
              uint64_t v29 = v105[10];
              id v92 = v28;
              id v124 = v28;
              uint64_t v128 = v29;
              dispatch_sync(v27, v120);
              id v30 = AFSiriLogContextFides;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                id v31 = *(void **)(*(void *)&buf[8] + 40);
                id v32 = [v31 count];
                *(_DWORD *)double v156 = 136315650;
                v157 = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:caseSen"
                       "sitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke_2";
                __int16 v158 = 2112;
                id v159 = v31;
                __int16 v160 = 2048;
                id v161 = v32;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s Recognition result %@, %lu", v156, 0x20u);
              }

              id v33 = objc_opt_new();
              uint64_t v34 = *(void **)(*(void *)&buf[8] + 40);
              if (v34 && [v34 count])
              {
                uint64_t v35 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
                long long v119 = 0u;
                long long v117 = 0u;
                long long v118 = 0u;
                long long v116 = 0u;
                uint64_t v93 = v35;
                id v36 = [v35 preITNTokens];
                id v37 = [v36 countByEnumeratingWithState:&v116 objects:v155 count:16];
                if (v37)
                {
                  uint64_t v38 = *(void *)v117;
                  id v107 = v36;
                  do
                  {
                    for (id i = 0; i != v37; id i = (char *)i + 1)
                    {
                      if (*(void *)v117 != v38) {
                        objc_enumerationMutation(v107);
                      }
                      id v40 = [*(id *)(*((void *)&v116 + 1) + 8 * i) tokenName];
                      double v41 = [v40 componentsSeparatedByString:@" "];

                      id v42 = v21;
                      id v43 = v8;
                      long long v114 = 0u;
                      long long v115 = 0u;
                      long long v112 = 0u;
                      long long v113 = 0u;
                      id v44 = v41;
                      id v45 = [v44 countByEnumeratingWithState:&v112 objects:v154 count:16];
                      if (v45)
                      {
                        uint64_t v46 = *(void *)v113;
                        do
                        {
                          for (j = 0; j != v45; j = (char *)j + 1)
                          {
                            if (*(void *)v113 != v46) {
                              objc_enumerationMutation(v44);
                            }
                            [v33 addObject:*(void *)(*((void *)&v112 + 1) + 8 * (void)j)];
                          }
                          id v45 = [v44 countByEnumeratingWithState:&v112 objects:v154 count:16];
                        }
                        while (v45);
                      }

                      id v8 = v43;
                      id v21 = v42;
                    }
                    id v36 = v107;
                    id v37 = [v107 countByEnumeratingWithState:&v116 objects:v155 count:16];
                  }
                  while (v37);
                }

                int v48 = *((unsigned __int8 *)v105 + 88);
                id v49 = sub_100022818(v33, v103, *((unsigned char *)v105 + 88) == 0);
                id v50 = AFSiriLogContextFides;
                if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)double v156 = 136315394;
                  v157 = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:caseS"
                         "ensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
                  __int16 v158 = 2112;
                  id v159 = v49;
                  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s Edit distance between tts ASR and original ASR %@", v156, 0x16u);
                }
                id v110 = 0;
                id v111 = 0;
                uint64_t v51 = sub_100024954(v100, v103, v48 == 0, &v111, &v110);
                id v52 = v111;
                id v89 = v52;
                id v90 = v110;
                uint64_t v88 = v51;
                if (v51 == -1)
                {
                  [v97 addObject:v102];
                }
                else
                {
                  id v91 = [v52 mutableCopy];
                  id v108 = [v90 mutableCopy];
                  if (*((unsigned char *)v105 + 89))
                  {
                    id v109 = 0;
                    id v94 = +[NSRegularExpression regularExpressionWithPattern:@"\\\\\\S+$" options:0 error:&v109];
                    id v87 = v109;
                    double v53 = (char *)[v108 count];
                    if ((uint64_t)(v53 - 1) >= 0)
                    {
                      while (1)
                      {
                        double v54 = [v108 objectAtIndexedSubscript:--v53];
                        id v55 = objc_msgSend(v94, "firstMatchInString:options:range:", v54, 0, 0, objc_msgSend(v54, "length"));
                        id v56 = v55;
                        if (v55) {
                          break;
                        }
LABEL_62:

                        if ((uint64_t)v53 <= 0) {
                          goto LABEL_63;
                        }
                      }
                      id v57 = [v55 range];
                      uint64_t v59 = objc_msgSend(v54, "substringWithRange:", v57, v58);
                      double v60 = (void *)v105[8];
                      id v61 = v59;
                      id v62 = v60;
                      double v63 = v62;
                      if (qword_10005DAE0 == -1)
                      {
                        if (v62) {
                          goto LABEL_52;
                        }
                        goto LABEL_55;
                      }
                      dispatch_once(&qword_10005DAE0, &stru_1000515D0);
                      if (!v63) {
                        goto LABEL_55;
                      }
LABEL_52:
                      if ([v63 containsObject:v61])
                      {
                        id v64 = 0;
                      }
                      else
                      {
LABEL_55:
                        uint64_t v65 = [(id)qword_10005DAD8 objectForKey:v61];
                        if (v65) {
                          id v64 = (__CFString *)v65;
                        }
                        else {
                          id v64 = @"PERSONALINFO";
                        }
                      }

                      if (v64 && v64 != @"PERSONALINFO")
                      {
                        [v91 removeObjectAtIndex:v53];
                        [v108 removeObjectAtIndex:v53];
                      }

                      goto LABEL_62;
                    }
LABEL_63:
                  }
                  id v66 = AFSiriLogContextFides;
                  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)double v156 = 136315650;
                    v157 = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:cas"
                           "eSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
                    __int16 v158 = 2112;
                    id v159 = v91;
                    __int16 v160 = 2112;
                    id v161 = v108;
                    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%s correctedOutput: %@, recognizedOutput %@", v156, 0x20u);
                  }
                  [v102 setValue:v91 forKey:@"correctedOutput"];
                  [v102 setValue:v108 forKey:@"recognizedOutput"];
                  id v67 = +[NSNumber numberWithInteger:v88];
                  [v102 setValue:v67 forKey:@"editDistanceRecognizedCorrected"];

                  id v68 = [v49 objectForKeyedSubscript:@"EditDistance"];
                  [v102 setValue:v68 forKey:@"editDistanceRecognizedTTSASR"];

                  [v106 timestamp];
                  id v69 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  [v102 setValue:v69 forKey:@"timestamp"];

                  id v70 = [v106 interactionIdentifier];
                  [v102 setValue:v70 forKey:@"interactionId"];

                  double v71 = [v106 asrSelfComponentIdentifier];
                  [v102 setValue:v71 forKey:@"asrSelfComponentIdentifier"];

                  [v97 addObject:v102];
                }
              }
              else
              {
                [v97 addObject:v102];
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              [v97 addObject:v102];
            }
          }
          else
          {
            double v73 = AFSiriLogContextFides;
            if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:sampling"
                                   "Rate:caseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%s No audio data provided for UUID %@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v72 = AFSiriLogContextFides;
          if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRa"
                                 "te:caseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%s Unable to load localSpeechDESRecord", buf, 0xCu);
          }
        }

        if ((id)++v104 == v21)
        {
          id v74 = [v98 countByEnumeratingWithState:&v129 objects:v168 count:16];
          id v21 = v74;
          if (!v74) {
            goto LABEL_81;
          }
          goto LABEL_14;
        }
      }
      double v81 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:c"
                             "aseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "%s Interrupted corrected text evaluation redecoding", buf, 0xCu);
      }
      NSErrorUserInfoKey v166 = NSLocalizedDescriptionKey;
      CFStringRef v167 = @"Interrupted corrected text evaluation during speech recognition";
      uint64_t v82 = +[NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];
      uint64_t v83 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v82];
      uint64_t v84 = (void *)v147[5];
      v147[5] = v83;

      (*(void (**)(void))(v105[9] + 16))();
LABEL_89:

      _Block_object_dispose(v169, 8);
    }
    else
    {
      id v77 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
      {
        uint64_t v86 = v105[4];
        *(_DWORD *)id v169 = 136315394;
        *(void *)&v169[4] = "-[ESConnection runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:"
                              "caseSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke";
        *(_WORD *)&v169[12] = 2112;
        *(void *)&v169[14] = v86;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%s No tokenizer for %@", v169, 0x16u);
      }
      id v97 = +[NSString stringWithFormat:@"No tokenizer for %@", v105[4]];
      NSErrorUserInfoKey v173 = NSLocalizedDescriptionKey;
      id v174 = v97;
      double v78 = +[NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];
      uint64_t v79 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v78];
      id v80 = (void *)v147[5];
      v147[5] = v79;

      (*(void (**)(void))(v105[9] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[9] + 16))();
  }

  _Block_object_dispose(&v140, 8);
  _Block_object_dispose(&v146, 8);
}

void sub_100024744(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Unwind_Resume(a1);
}

void sub_10002482C(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(unsigned __int8 *)(a1[5] + 26);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = +[ESConnection _speechRecognizerWithAssetConfig:v2 enableITN:0 isHighPriority:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_1000248B0(uint64_t a1, void *a2)
{
}

void sub_1000248C0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 recognitionResultsWithAudioData:v6 userProfileData:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) language:*(void *)(a1 + 48) task:*(void *)(a1 + 56) samplingRate:*(void *)(a1 + 88) extraLanguageModel:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t sub_100024954(void *a1, void *a2, int a3, void *a4, void *a5)
{
  int v89 = a3;
  id v8 = a1;
  id v9 = a2;
  id v91 = v8;
  uint64_t v10 = (char *)[v8 count];
  id v90 = v9;
  id v11 = [v9 count];
  uint64_t v12 = -1;
  if (v10)
  {
    int64_t v13 = (int64_t)v11;
    if (v11)
    {
      for (id i = 0; i != v10; ++i)
      {
        long long v15 = [v91 objectAtIndexedSubscript:i];

        if (v15 == @"~")
        {
LABEL_52:
          uint64_t v12 = -1;
          goto LABEL_53;
        }
      }
      id v16 = 0;
      do
      {
        long long v17 = [v90 objectAtIndexedSubscript:v16];

        if (v17 == @"~") {
          goto LABEL_52;
        }
        ++v16;
      }
      while ((char *)v13 != v16);
      double v78 = a4;
      uint64_t v79 = a5;
      id v92 = 0;
      id v88 = +[NSRegularExpression regularExpressionWithPattern:@"\\\\\\S*$" options:0 error:&v92];
      uint64_t v76 = (uint64_t)&v76;
      id v77 = v92;
      __chkstk_darwin(v77);
      id v19 = (char *)&v76 - v18;
      uint64_t v20 = 0;
      unint64_t v85 = v21;
      uint64_t v22 = 1;
      if (v21 > 1) {
        uint64_t v22 = v13 + 1;
      }
      do
      {
        *(void *)&v19[8 * v20] = v20;
        ++v20;
      }
      while (v22 != v20);
      uint64_t v23 = (uint64_t)&v19[8 * v13 + 16];
      uint64_t v82 = 8 * v13 + 8;
      unint64_t v83 = (unint64_t)v10;
      uint64_t v24 = 1;
      uint64_t v84 = v19;
      unint64_t v87 = v13;
      do
      {
        uint64_t v25 = 0;
        uint64_t v26 = v24 - 1;
        uint64_t v27 = *(void *)&v84[8 * (v24 - 1) * v85] + 1;
        uint64_t v86 = (char *)v24;
        *(void *)&v84[8 * v24 * v85] = v27;
        do
        {
          id v28 = [v90 objectAtIndexedSubscript:v25];
          uint64_t v29 = [v91 objectAtIndexedSubscript:v26];
          if (v89)
          {
            uint64_t v30 = [v28 lowercaseString];

            uint64_t v31 = [v29 lowercaseString];

            uint64_t v29 = (void *)v31;
            id v28 = (void *)v30;
          }
          id v32 = [v28 length];
          id v33 = v88;
          uint64_t v34 = objc_msgSend(v88, "stringByReplacingMatchesInString:options:range:withTemplate:", v28, 0, 0, v32, &stru_1000519F0);

          uint64_t v35 = objc_msgSend(v33, "stringByReplacingMatchesInString:options:range:withTemplate:", v29, 0, 0, objc_msgSend(v29, "length"), &stru_1000519F0);

          id v36 = &v19[8 * v25];
          uint64_t v37 = *(void *)v36;
          unsigned int v38 = [v34 isEqualToString:v35];
          uint64_t v39 = *((void *)v36 + 1) + 1;
          if (v39 >= v27 + 1) {
            uint64_t v39 = v27 + 1;
          }
          if (v37 + (v38 ^ 1) >= v39) {
            uint64_t v27 = v39;
          }
          else {
            uint64_t v27 = v37 + (v38 ^ 1);
          }
          *(void *)(v23 + 8 * v25) = v27;

          unint64_t v40 = v25 + 2;
          ++v25;
          unint64_t v41 = v87;
        }
        while (v40 <= v87);
        uint64_t v24 = (uint64_t)(v86 + 1);
        uint64_t v42 = v83;
        v23 += v82;
        v19 += v82;
      }
      while ((unint64_t)(v86 + 1) <= v83);
      id v43 = +[NSMutableArray array];
      id v44 = +[NSMutableArray array];
      uint64_t v45 = v41;
      id v80 = v44;
      double v81 = v43;
      while (v42)
      {
        if (v45)
        {
          uint64_t v46 = v45 - 1;
          double v47 = [v90 objectAtIndexedSubscript:v45 - 1];
          int v48 = [v91 objectAtIndexedSubscript:v42 - 1];
          if (v89)
          {
            uint64_t v49 = [v47 lowercaseString];

            uint64_t v50 = [v48 lowercaseString];

            double v47 = (void *)v49;
            int v48 = (void *)v50;
          }
          id v51 = [v47 length];
          id v52 = v88;
          objc_msgSend(v88, "stringByReplacingMatchesInString:options:range:withTemplate:", v47, 0, 0, v51, &stru_1000519F0);
          double v53 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v86 = v53;

          double v54 = objc_msgSend(v52, "stringByReplacingMatchesInString:options:range:withTemplate:", v48, 0, 0, objc_msgSend(v48, "length"), &stru_1000519F0);

          unint64_t v55 = v85;
          uint64_t v82 = v42 - 1;
          id v56 = v84;
          id v57 = &v84[8 * (v42 - 1) * v85];
          uint64_t v58 = *(void *)&v57[8 * v46];
          unsigned int v59 = [v53 isEqualToString:v54];
          uint64_t v60 = *(void *)&v57[8 * v45];
          uint64_t v61 = *(void *)&v56[8 * v42 * v55 + 8 * v46];
          uint64_t v62 = v60 + 1;
          if (v60 + 1 >= v61 + 1) {
            uint64_t v62 = v61 + 1;
          }
          BOOL v63 = v60 <= v61;
          if (v60 <= v61) {
            uint64_t v64 = v45;
          }
          else {
            uint64_t v64 = v45 - 1;
          }
          uint64_t v65 = v58 + (v59 ^ 1);
          if (v63 || v65 <= v62) {
            uint64_t v67 = v82;
          }
          else {
            uint64_t v67 = v42;
          }
          if (v65 <= v62) {
            uint64_t v68 = v45 - 1;
          }
          else {
            uint64_t v68 = v64;
          }

          id v44 = v80;
          id v43 = v81;
LABEL_44:
          id v69 = @"~";
          if (v67 == v42) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }
        uint64_t v68 = 0;
        uint64_t v67 = v42 - 1;
LABEL_47:
        id v69 = [v91 objectAtIndexedSubscript:v67];
        uint64_t v42 = v67;
LABEL_48:
        id v70 = @"~";
        if (v68 != v45)
        {
          id v70 = [v90 objectAtIndexedSubscript:v68];
        }
        [v43 addObject:v69];
        [v44 addObject:v70];

        uint64_t v45 = v68;
        if (!(v42 | v68))
        {
          double v71 = [v43 reverseObjectEnumerator];
          id v72 = [v71 allObjects];
          *double v78 = v72;

          double v73 = [v44 reverseObjectEnumerator];
          id v74 = [v73 allObjects];
          void *v79 = v74;

          uint64_t v12 = *(void *)&v84[8 * v85 * v83 + 8 * v41];
          goto LABEL_53;
        }
      }
      uint64_t v67 = 0;
      uint64_t v68 = v45 - 1;
      goto LABEL_44;
    }
  }
LABEL_53:

  return v12;
}

void sub_100024F4C(id a1)
{
  uint64_t v1 = (void *)qword_10005DAD8;
  qword_10005DAD8 = (uint64_t)&off_1000542B8;
}

void sub_100025094(uint64_t a1)
{
  uint64_t v79 = 0;
  id v80 = &v79;
  uint64_t v81 = 0x3032000000;
  uint64_t v82 = sub_10001CDFC;
  unint64_t v83 = sub_10001CE0C;
  id v84 = 0;
  id v2 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:*(void *)(a1 + 32) task:*(void *)(a1 + 40)];
  uint64_t v40 = a1;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x3032000000;
  uint64_t v76 = sub_10001CDFC;
  id v77 = sub_10001CE0C;
  id v78 = 0;
  uint64_t v3 = qword_10005D9E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025960;
  block[3] = &unk_100051128;
  double v71 = &v73;
  id v32 = v2;
  id v70 = v32;
  id v72 = &v79;
  dispatch_sync(v3, block);
  if (v74[5])
  {
    id v35 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v63 = 0;
    uint64_t v64 = &v63;
    uint64_t v65 = 0x3032000000;
    id v66 = sub_10001CDFC;
    uint64_t v67 = sub_10001CE0C;
    id v68 = 0;
    id v33 = +[CESRUtilities speechProfilePathsWithLanguage:*(void *)(v40 + 32)];
    if ([v33 count] == (id)1)
    {
      id v4 = objc_alloc((Class)NSData);
      uint64_t v5 = [v33 firstObject];
      id v6 = [v4 initWithContentsOfFile:v5 options:0 error:0];
      unint64_t v7 = (void *)v64[5];
      void v64[5] = (uint64_t)v6;
    }
    id v8 = v64;
    id v9 = AFSiriLogContextFides;
    if (v64[5])
    {
      uint64_t v10 = AFSiriLogContextFides;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(id)v8[5] length];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ESConnection redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Loaded speech profile: %lu bytes", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ESConnection redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Unable to load speech profile", buf, 0xCu);
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = *(id *)(v40 + 48);
    id v36 = [obj countByEnumeratingWithState:&v59 objects:v93 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v60;
      while (2)
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v60 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void *)(*((void *)&v59 + 1) + 8 * (void)v39);
          if ([*(id *)(v40 + 56) _invalidated])
          {
            id v28 = AFSiriLogContextFides;
            if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[ESConnection redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Interrupted corrected text evaluation redecoding", buf, 0xCu);
            }
            NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
            CFStringRef v92 = @"Interrupted corrected text redecoding during speech recognition";
            uint64_t v29 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            uint64_t v30 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1101 userInfo:v29];
            uint64_t v31 = (void *)v80[5];
            v80[5] = v30;

            (*(void (**)(void))(*(void *)(v40 + 64) + 16))();
            goto LABEL_45;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v88 = sub_10001CDFC;
          int v89 = sub_10001CE0C;
          id v90 = 0;
          uint64_t v12 = qword_10005D9E8;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1000259E4;
          v50[3] = &unk_100051150;
          unint64_t v55 = buf;
          id v56 = &v73;
          id v51 = *(id *)(v40 + 48);
          uint64_t v52 = v38;
          id v57 = &v63;
          id v53 = *(id *)(v40 + 32);
          id v13 = *(id *)(v40 + 40);
          uint64_t v14 = *(void *)(v40 + 72);
          id v54 = v13;
          uint64_t v58 = v14;
          dispatch_sync(v12, v50);
          id v41 = objc_alloc_init((Class)NSMutableArray);
          long long v15 = *(void **)(*(void *)&buf[8] + 40);
          if (v15 && [v15 count])
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v16 = *(id *)(*(void *)&buf[8] + 40);
            id v17 = [v16 countByEnumeratingWithState:&v46 objects:v86 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v47;
              do
              {
                id v19 = 0;
                do
                {
                  if (*(void *)v47 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v19);
                  id v21 = objc_alloc_init((Class)NSMutableArray);
                  long long v44 = 0u;
                  long long v45 = 0u;
                  long long v42 = 0u;
                  long long v43 = 0u;
                  uint64_t v22 = [v20 preITNTokens];
                  id v23 = [v22 countByEnumeratingWithState:&v42 objects:v85 count:16];
                  if (v23)
                  {
                    uint64_t v24 = *(void *)v43;
                    do
                    {
                      uint64_t v25 = 0;
                      do
                      {
                        if (*(void *)v43 != v24) {
                          objc_enumerationMutation(v22);
                        }
                        uint64_t v26 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)v25) tokenName];
                        [v21 addObject:v26];

                        uint64_t v25 = (char *)v25 + 1;
                      }
                      while (v23 != v25);
                      id v23 = [v22 countByEnumeratingWithState:&v42 objects:v85 count:16];
                    }
                    while (v23);
                  }

                  if ([v21 count]) {
                    [v41 addObject:v21];
                  }

                  id v19 = (char *)v19 + 1;
                }
                while (v19 != v17);
                id v17 = [v16 countByEnumeratingWithState:&v46 objects:v86 count:16];
              }
              while (v17);
            }
          }
          if ([v41 count]) {
            [v35 setObject:v41 forKeyedSubscript:v38];
          }

          _Block_object_dispose(buf, 8);
          uint64_t v39 = (char *)v39 + 1;
        }
        while (v39 != v36);
        id v36 = [obj countByEnumeratingWithState:&v59 objects:v93 count:16];
        if (v36) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = *(void *)(v40 + 64);
    if (v27) {
      (*(void (**)(uint64_t, id, void))(v27 + 16))(v27, v35, 0);
    }
LABEL_45:

    _Block_object_dispose(&v63, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(v40 + 64) + 16))();
  }

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
}

void sub_1000258D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
}

void sub_100025960(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[ESConnection _speechRecognizerWithAssetConfig:v2 enableITN:0 isHighPriority:0 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_1000259E4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 recognitionResultsWithAudioData:v6 userProfileData:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) language:*(void *)(a1 + 48) task:*(void *)(a1 + 56) samplingRate:*(void *)(a1 + 88) extraLanguageModel:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_100025C7C(uint64_t a1)
{
  uint64_t v2 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ESConnection _scheduleCompilationTimerForAssetType:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Model compilation timer for %@ assets fired.", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 40) compileAllAssetsWithType:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

id sub_100025ED8(uint64_t a1)
{
  uint64_t v2 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[ESConnection _scheduleCacheResetTimer:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Cache reset timer fired.", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) resetCacheWithCompletion:*(void *)(a1 + 40)];
}

void sub_100026438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026464(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = &AFAnalyticsEventCreateCurrent_ptr;
      uint64_t v13 = *(void *)v61;
      id v54 = v8;
      id v55 = v7;
      uint64_t v52 = a1;
      id v53 = a4;
      id v51 = v9;
      uint64_t v48 = *(void *)v61;
      while (2)
      {
        uint64_t v14 = 0;
        id v49 = v11;
        do
        {
          if (*(void *)v61 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v50 = v14;
          long long v15 = *(void **)(*((void *)&v60 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v42 = kAFAssistantErrorDomain;
            NSErrorUserInfoKey v67 = NSLocalizedFailureReasonErrorKey;
            long long v43 = +[NSString stringWithFormat:@"Not an array: %@", v15];
            id v68 = v43;
            long long v44 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
            uint64_t v45 = +[NSError errorWithDomain:v42 code:1102 userInfo:v44];
            uint64_t v46 = *(void *)(*(void *)(a1 + 40) + 8);
            long long v47 = *(void **)(v46 + 40);
            *(void *)(v46 + 40) = v45;

            *a4 = 1;
            goto LABEL_21;
          }
          id v16 = [v12[276] array];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v17 = v15;
          id v18 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v57;
            while (2)
            {
              for (id i = 0; i != v19; id i = (char *)i + 1)
              {
                if (*(void *)v57 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v36 = kAFAssistantErrorDomain;
                  NSErrorUserInfoKey v64 = NSLocalizedFailureReasonErrorKey;
                  uint64_t v37 = +[NSString stringWithFormat:@"Not a dictionary: %@", v17];
                  uint64_t v65 = v37;
                  uint64_t v38 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
                  uint64_t v39 = +[NSError errorWithDomain:v36 code:1102 userInfo:v38];
                  uint64_t v40 = *(void *)(*(void *)(v52 + 40) + 8);
                  id v41 = *(void **)(v40 + 40);
                  *(void *)(v40 + 40) = v39;

                  *id v53 = 1;
                  id v8 = v54;
                  id v7 = v55;
                  id v9 = v51;
                  goto LABEL_21;
                }
                id v23 = [v22 objectForKey:@"orth"];
                uint64_t v24 = [v22 objectForKey:@"prons"];
                uint64_t v25 = +[NSSet setWithArray:v24];

                uint64_t v26 = [v22 objectForKey:@"tag"];
                uint64_t v27 = [v22 objectForKey:@"freq"];
                id v28 = [v27 integerValue];

                id v29 = [objc_alloc((Class)_EARWordPart) initWithOrthography:v23 pronunciations:v25 tagName:v26 frequency:v28];
                [v16 addObject:v29];
              }
              id v19 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          a1 = v52;
          id v7 = v55;
          [*(id *)(v52 + 32) addWordWithParts:v16 templateName:v55];

          uint64_t v14 = v50 + 1;
          a4 = v53;
          id v8 = v54;
          id v9 = v51;
          uint64_t v12 = &AFAnalyticsEventCreateCurrent_ptr;
          uint64_t v13 = v48;
        }
        while ((id)(v50 + 1) != v49);
        id v11 = [v51 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    uint64_t v30 = kAFAssistantErrorDomain;
    NSErrorUserInfoKey v70 = NSLocalizedFailureReasonErrorKey;
    uint64_t v31 = +[NSString stringWithFormat:@"Not an array: %@", v8];
    double v71 = v31;
    id v32 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    uint64_t v33 = +[NSError errorWithDomain:v30 code:1102 userInfo:v32];
    uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8);
    id v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;

    *a4 = 1;
  }
}

void sub_100026DD0(id a1)
{
  id v1 = +[ESAssetManager sharedInstance];
  [v1 cleanupUnusedSubscriptions];
}

void sub_100026E2C(id a1)
{
  id v1 = +[ESAssetManager sharedInstance];
  [v1 handlePostUpgradeSubscriptions];
}

void sub_1000272F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027308(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  double v8 = *(float *)(a1 + 48);
  id v9 = [*(id *)(*(void *)(a1 + 32) + 224) objectAtIndexedSubscript:a3];
  [v9 doubleValue];
  double v11 = v10;

  if (v11 >= v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100027658(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 data];
  [*(id *)(*(void *)(a1 + 32) + 104) addAudioPacket:v3];
  int v4 = [*(id *)(a1 + 32) _audioDataPostRecognitionStart:v3];

  [v5 setData:v4];
  if (v4) {
    [*(id *)(a1 + 32) _processAudioPacket:v5];
  }
}

void sub_100027B34(uint64_t a1)
{
  uint64_t v2 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
    __int16 v57 = 2112;
    uint64_t v58 = v3;
    __int16 v59 = 2112;
    long long v60 = v4;
    __int16 v61 = 2112;
    uint64_t v62 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Received corrected texts, interactionId: %@, correctedText: %@, correctedTextV2: %@", buf, 0x2Au);
  }
  if (qword_10005DAA0)
  {
    id v6 = [(id)qword_10005DAA0 valueForKey:*(void *)(a1 + 32)];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(id)qword_10005DAA0 valueForKey:*(void *)(a1 + 32)];

      if (!v7) {
        goto LABEL_25;
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v6 = v7;
      id v8 = [v6 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v8)
      {
        id v10 = v8;
        CFStringRef v11 = @"^20";
        CFStringRef v12 = @" ";
        uint64_t v13 = *(void *)v51;
        *(void *)&long long v9 = 136315138;
        long long v48 = v9;
        do
        {
          uint64_t v14 = 0;
          id v49 = v10;
          do
          {
            if (*(void *)v51 != v13) {
              objc_enumerationMutation(v6);
            }
            long long v15 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * (void)v14), "stringByReplacingOccurrencesOfString:withString:", v11, v12, v48);
            id v16 = [v15 stringByReplacingOccurrencesOfString:@"\\jit" withString:&stru_1000519F0];

            if ([v16 length])
            {
              id v17 = [*(id *)(a1 + 40) rangeOfString:v16];
              id v18 = objc_alloc((Class)PPFeedback);
              if (v17 == (id)0x7FFFFFFFFFFFFFFFLL) {
                id v19 = [v18 initWithExplicitlyRejectedString:v16];
              }
              else {
                id v19 = [v18 initWithImplicitlyEngagedString:v16];
              }
              uint64_t v20 = v19;
              id v21 = +[PPNamedEntityStore defaultStore];
              uint64_t v22 = v21;
              if (v21 && v20)
              {
                uint64_t v23 = v13;
                CFStringRef v24 = v12;
                CFStringRef v25 = v11;
                id v26 = v6;
                uint64_t v27 = a1;
                [v21 setClientIdentifier:@"dictation"];
                [v20 setClientIdentifier:@"dictation"];
                id v28 = AFSiriLogContextSpeech;
                if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v48;
                  long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Sending dictation feedback to Portrait based on correction", buf, 0xCu);
                }
                [v22 registerFeedback:v20 completion:0];
                a1 = v27;
                id v6 = v26;
                CFStringRef v11 = v25;
                CFStringRef v12 = v24;
                uint64_t v13 = v23;
                id v10 = v49;
              }
            }
            uint64_t v14 = (char *)v14 + 1;
          }
          while (v10 != v14);
          id v10 = [v6 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v10);
      }
    }
  }
LABEL_25:
  if (qword_10005DA78)
  {
    id v29 = [(id)qword_10005DA78 interactionIdentifier];
    unsigned int v30 = [v29 isEqualToString:*(void *)(a1 + 32)];

    if (v30)
    {
      [(id)qword_10005DA78 setCorrectedText:*(void *)(a1 + 40)];
      [(id)qword_10005DA78 setCorrectedTextV2:*(void *)(a1 + 48)];
      uint64_t v31 = (void *)qword_10005DA78;
      id v32 = [*(id *)(a1 + 56) alternativesSelectedInfo];
      [v31 setAlternatives:v32];

      uint64_t v33 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v44 = *(void *)(a1 + 32);
        uint64_t v45 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
        __int16 v57 = 2112;
        uint64_t v58 = v44;
        __int16 v59 = 2112;
        long long v60 = v45;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s Set correctedText for CESRFidesASRRecord, interactionId: %@, correctedText: %@", buf, 0x20u);
        uint64_t v33 = AFSiriLogContextSpeech;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v46 = *(void *)(a1 + 32);
        long long v47 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
        __int16 v57 = 2112;
        uint64_t v58 = v46;
        __int16 v59 = 2112;
        long long v60 = v47;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s Set correctedTextV2 for CESRFidesASRRecord, interactionId: %@, correctedTextV2: %@", buf, 0x20u);
        uint64_t v33 = AFSiriLogContextSpeech;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = *(void *)(a1 + 32);
        id v35 = *(void **)(a1 + 56);
        uint64_t v36 = v33;
        uint64_t v37 = [v35 alternativesSelectedInfo];
        uint64_t v38 = [v37 description];
        *(_DWORD *)buf = 136315650;
        long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
        __int16 v57 = 2112;
        uint64_t v58 = v34;
        __int16 v59 = 2112;
        long long v60 = v38;
        _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%s Set alternativeSelection for CESRFidesASRRecord, interactionId: %@, alternatives: %@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v39 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Interaction identifier did not match the DES record in memory", buf, 0xCu);
      }
    }
  }
  if (qword_10005DA98)
  {
    [(id)qword_10005DA98 setCorrectedText:*(void *)(a1 + 48) interactionId:*(void *)(a1 + 32)];
    uint64_t v40 = (void *)qword_10005DA98;
    id v41 = [*(id *)(a1 + 56) alternativesSelectedInfo];
    [v40 setSelectedAlternatives:v41];

    uint64_t v42 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      long long v56 = "-[ESConnection sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
      __int16 v57 = 2112;
      uint64_t v58 = v43;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s Set correctedText for Biome edit record, interactionId: %@", buf, 0x16u);
    }
  }
}

void sub_10002B208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose((const void *)(v63 - 208), 8);
  _Unwind_Resume(a1);
}

id sub_10002B2F4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = v5;
  if (v3) {
    [v5 addEntriesFromDictionary:v3];
  }
  if (v4) {
    [v6 setObject:v4 forKey:@"ModelOverrideURL"];
  }

  return v6;
}

id sub_10002B380(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = sub_10002B424(v3, @"etiquette.json", v4);

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }

  return v2;
}

id sub_10002B424(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = +[ESAssetManager sharedInstance];
  id v30 = 0;
  id v8 = [v7 installedQuasarModelPathForAssetConfig:v5 error:&v30];
  id v9 = v30;

  if (v8)
  {
    id v10 = [v8 stringByAppendingPathComponent:v6];
    id v29 = v9;
    CFStringRef v11 = +[NSData dataWithContentsOfFile:v10 options:0 error:&v29];
    id v12 = v29;

    if (!v11)
    {
      id v17 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v32 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Could not read %@: %@", buf, 0x20u);
      }
      id v15 = 0;
      goto LABEL_21;
    }
    id v28 = v12;
    uint64_t v13 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:&v28];
    id v14 = v28;

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v32) = 1;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10002BD4C;
        v24[3] = &unk_1000515B0;
        uint64_t v27 = a3;
        id v25 = v6;
        id v26 = buf;
        [v13 enumerateKeysAndObjectsUsingBlock:v24];
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          id v15 = v13;
        }
        else {
          id v15 = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }
      id v19 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        id v21 = v19;
        uint64_t v22 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v32 = v22;
        id v23 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s %@ is wrong type: %@", buf, 0x20u);
      }
    }
    else
    {
      id v18 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v32 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Could not parse %@: %@", buf, 0x20u);
      }
    }
    id v15 = 0;
LABEL_20:

    id v12 = v14;
LABEL_21:

    id v9 = v12;
    goto LABEL_22;
  }
  id v16 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Could not locate asset: %@", buf, 0x16u);
  }
  id v15 = 0;
LABEL_22:

  return v15;
}

void sub_10002B85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10002B87C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&off_100054180 forKey:a2];
}

void sub_10002B890(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 304);
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Fetching contextual data for task: %@", buf, 0x16u);
      uint64_t v2 = *(void **)(a1 + 32);
    }
    [v2 fetchNamedEntitiesWithTimeInterval:0.0];
    unsigned int v5 = [*(id *)(a1 + 32) containsEntity];
  }
  else
  {
    unsigned int v5 = 0;
  }
  id v6 = [*(id *)(a1 + 48) count];
  if ((v5 & 1) != 0 || v6)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = [*(id *)(a1 + 64) modelOverrideURL];
    id v10 = [v9 path];
    uint64_t v11 = *(void *)(a1 + 72);
    id v32 = 0;
    id v12 = [v7 _userProfileWithAssetConfig:v8 modelOverridePath:v10 overrides:v11 isJit:1 returningFoundPath:0 error:&v32];
    id v13 = v32;

    if (v12)
    {
      if ([*(id *)(a1 + 48) count])
      {
        [v12 createInlineLmeUserDataForContextStrings:*(void *)(a1 + 48)];
        uint64_t v14 = [v12 dataProfile];
        uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
      else if (v5)
      {
        id v18 = [*(id *)(a1 + 32) contextualData];

        if (v18)
        {
          id v19 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v34 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Injecting contextual data to recognizer", buf, 0xCu);
          }
          uint64_t v20 = [*(id *)(a1 + 32) contextualData];
          id v21 = [*(id *)(a1 + 64) profile];
          uint64_t v22 = [v12 createInlineLmeUserDataForContextData:v20 speechProfile:v21];
          uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
          CFStringRef v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;

          id v25 = (void *)AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
          {
            id v26 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            uint64_t v27 = v25;
            id v28 = [v26 length];
            *(_DWORD *)buf = 136315394;
            uint64_t v34 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
            __int16 v35 = 2048;
            id v36 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Built inline LME from contextual data, size: %zu", buf, 0x16u);
          }
        }
      }
      uint64_t v29 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      uint64_t v30 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }
    else
    {
      id v17 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
        __int16 v35 = 2112;
        id v36 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Failed to initialize jit profile builder due to error : %@", buf, 0x16u);
      }
    }
  }
}

id sub_10002BC1C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 samplingRateFilter];
  id v3 = [v1 taskTypeFilter];
  uint64_t v4 = [v1 farFieldFilter];
  unsigned int v5 = [v1 deviceIdFilter];
  id v6 = [v1 bluetoothDeviceIdFilter];
  id v7 = [v1 aneContextFilter];
  uint64_t v8 = [v1 cpuContextFilter];
  id v9 = [v1 gpuContextFilter];

  id v10 = +[NSString stringWithFormat:@"sampling rate = %@\ntask type = %@\nfar field = %@\ndevice ID = %@\n[DEPRECATED] bluetooth device ID = %@\nANE context = %@\nCPU context = %@\nGPU context = %@\n", v2, v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

void sub_10002BD4C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136315906;
      id v12 = "ReplacementDictionaryForAssetConfig_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@ contains bogus key/value pair: %@ => %@", (uint8_t *)&v11, 0x2Au);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
}

void sub_10002BE8C(id a1, CESRSpeechParametersMutating *a2)
{
}

void sub_10002C05C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 modelVersion];
  id v7 = [v6 modelType];

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

void sub_10002D230(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v13 = 0;
    goto LABEL_11;
  }
  id v7 = [v5 objectForKey:@"quasarModelPath"];
  id v8 = [v5 objectForKey:@"type"];
  id v9 = [v7 stringByAppendingPathComponent:@"mini.json"];
  if (+[CESRUtilities isFilePathValid:v9])
  {
    id v10 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v9];
    int v11 = v10;
    if (v10)
    {
      id v12 = [v10 version];
      id v13 = [objc_alloc((Class)CESRModelProperties) initWithModelVersion:v12 modelType:v8 modelRoot:v7];
    }
    else
    {
      id v13 = 0;
    }

LABEL_11:
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19)
    {
      if (v13) {
        id v20 = 0;
      }
      else {
        id v20 = v6;
      }
      (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v13, v20);
    }
    goto LABEL_16;
  }
  uint64_t v14 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
  __int16 v15 = +[NSString stringWithFormat:@"No file at path: %@", v9];
  id v26 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  __int16 v17 = +[NSError errorWithDomain:v14 code:600 userInfo:v16];

  id v18 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[ESConnection fetchModelPropertiesForAssetConfig:completion:]_block_invoke";
    __int16 v23 = 2112;
    CFStringRef v24 = v17;
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  id v13 = 0;
LABEL_16:
}

uint64_t sub_10002DB70(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 96);
  return result;
}

void sub_10002E05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002E080(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      uint64_t v4 = +[NSXPCListener _UUID];
      int v17 = 136315650;
      id v18 = "-[ESConnection initWithXPCConnection:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = WeakRetained;
      __int16 v21 = 2114;
      uint64_t v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@ cancelling instance %{public}@", (uint8_t *)&v17, 0x20u);
    }
    id v5 = objc_loadWeakRetained(WeakRetained + 2);
    [v5 cancelRecognition];

    id v6 = objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v7 = qword_10005DA00;

    if (v6 == (id)v7)
    {
      id v8 = (void *)qword_10005DA00;
      qword_10005DA00 = 0;
    }
    objc_storeWeak(WeakRetained + 2, 0);
    objc_storeWeak(WeakRetained + 1, 0);
    [WeakRetained[4] invalidate];
    id v9 = WeakRetained[4];
    WeakRetained[4] = 0;

    id v10 = WeakRetained[11];
    WeakRetained[11] = 0;

    *((unsigned char *)WeakRetained + 96) = 1;
    id v11 = WeakRetained[7];
    WeakRetained[7] = 0;

    id v12 = WeakRetained[8];
    WeakRetained[8] = 0;

    id v13 = WeakRetained[27];
    WeakRetained[27] = 0;

    id v14 = WeakRetained[28];
    WeakRetained[28] = 0;

    id v15 = WeakRetained[33];
    WeakRetained[33] = 0;

    id v16 = objc_loadWeakRetained(WeakRetained + 34);
    [v16 cancelRecognition];
  }
}

void sub_10002E364(uint64_t a1)
{
  id v5 = +[ESProfiler sharedProfiler];
  uint64_t v2 = [v5 selfHelper];
  id v3 = [v2 asrId];

  if (v3)
  {
    [v5 logAppleNeuralEngineModelInitializationEndedWithTimeInTicks:*(void *)(a1 + 32) fileName:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = +[ESSelfHelper createANEModelInitializationEndedEventWithTimeStamp:*(void *)(a1 + 32) fileName:*(void *)(a1 + 40)];
    +[ESConnection _addPendingProfilerANEModelInitializationEvent:v4];
  }
}

void sub_10002E4F8(uint64_t a1)
{
  id v5 = +[ESProfiler sharedProfiler];
  uint64_t v2 = [v5 selfHelper];
  id v3 = [v2 asrId];

  if (v3)
  {
    [v5 logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:*(void *)(a1 + 32) fileName:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = +[ESSelfHelper createANEModelInitializationStartedEventWithTimeStamp:*(void *)(a1 + 32) fileName:*(void *)(a1 + 40)];
    +[ESConnection _addPendingProfilerANEModelInitializationEvent:v4];
  }
}

void sub_10002F3BC(id a1)
{
}

void sub_100030A4C(id a1)
{
  qword_10005DA18 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];

  _objc_release_x1();
}

void sub_1000325D0(id a1)
{
  id v1 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315138;
    id v3 = "main_block_invoke";
    _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%s Received SIGTERM. Cleaning and Exiting", (uint8_t *)&v2, 0xCu);
  }
  +[ESConnection prepareToExit];
  exit(0);
}

uint64_t AFAnalyticsEventCreateCurrent()
{
  return _AFAnalyticsEventCreateCurrent();
}

uint64_t AFCreateDirectoryWithPath()
{
  return _AFCreateDirectoryWithPath();
}

uint64_t AFDeviceHighestLanguageModelCapabilityIdentifier()
{
  return _AFDeviceHighestLanguageModelCapabilityIdentifier();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return _AFDeviceSupportsSiriUOD();
}

uint64_t AFIsATV()
{
  return _AFIsATV();
}

uint64_t AFIsHorseman()
{
  return _AFIsHorseman();
}

uint64_t AFIsInternalInstall()
{
  return _AFIsInternalInstall();
}

uint64_t AFLibraryDirectoryWithSubPath()
{
  return _AFLibraryDirectoryWithSubPath();
}

uint64_t AFLogInitIfNeeded()
{
  return _AFLogInitIfNeeded();
}

uint64_t AFOfflineDictationCapable()
{
  return _AFOfflineDictationCapable();
}

uint64_t AFOfflineDictationLanguageForKeyboardLanguage()
{
  return _AFOfflineDictationLanguageForKeyboardLanguage();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return _AFOfflineDictationStatusStringIsInstalled();
}

uint64_t AFPreferencesMobileUserSessionLanguage()
{
  return _AFPreferencesMobileUserSessionLanguage();
}

uint64_t AFSiriDataSharingOptInStatusGetName()
{
  return _AFSiriDataSharingOptInStatusGetName();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t CESRSpeechProfileBuilderServiceGetXPCInterface()
{
  return _CESRSpeechProfileBuilderServiceGetXPCInterface();
}

uint64_t CESRSpeechServiceDelegateGetXPCInterface()
{
  return _CESRSpeechServiceDelegateGetXPCInterface();
}

uint64_t CESRSpeechServiceGetXPCInterface()
{
  return _CESRSpeechServiceGetXPCInterface();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CoreEmbeddedSpeechRecognizerGetIsHighPriorityFromInstanceUUID()
{
  return _CoreEmbeddedSpeechRecognizerGetIsHighPriorityFromInstanceUUID();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SFEntitledAssetStatusIsHighQuality()
{
  return _SFEntitledAssetStatusIsHighQuality();
}

uint64_t SFEntitledAssetStatusIsInstalled()
{
  return _SFEntitledAssetStatusIsInstalled();
}

uint64_t SFEntitledAssetTypeToString()
{
  return _SFEntitledAssetTypeToString();
}

uint64_t _AFPreferencesValueForKeyWithContext()
{
  return __AFPreferencesValueForKeyWithContext();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t earPackageResultCandidateId()
{
  return _earPackageResultCandidateId();
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

{
}

{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

uint64_t setEARPackageResultCandidateId()
{
  return _setEARPackageResultCandidateId();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

void uuid_clear(uuid_t uu)
{
}

uint64_t xpc_get_instance()
{
  return _xpc_get_instance();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_Dictation(void *a1, const char *a2, ...)
{
  return [a1 Dictation];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_UserEdit(void *a1, const char *a2, ...)
{
  return [a1 UserEdit];
}

id objc_msgSend__UUID(void *a1, const char *a2, ...)
{
  return [a1 _UUID];
}

id objc_msgSend__cachedRecognizerCleanUp(void *a1, const char *a2, ...)
{
  return [a1 _cachedRecognizerCleanUp];
}

id objc_msgSend__cancelCooldownTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelCooldownTimer];
}

id objc_msgSend__clearPendingAnalyticsEvents(void *a1, const char *a2, ...)
{
  return [a1 _clearPendingAnalyticsEvents];
}

id objc_msgSend__clearPendingProfilerEvents(void *a1, const char *a2, ...)
{
  return [a1 _clearPendingProfilerEvents];
}

id objc_msgSend__cooldownTimerTimeoutSeconds(void *a1, const char *a2, ...)
{
  return [a1 _cooldownTimerTimeoutSeconds];
}

id objc_msgSend__createAudioFilePath(void *a1, const char *a2, ...)
{
  return [a1 _createAudioFilePath];
}

id objc_msgSend__createCachesDirectoryIfItDoesNotExist(void *a1, const char *a2, ...)
{
  return [a1 _createCachesDirectoryIfItDoesNotExist];
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return [a1 _delegate];
}

id objc_msgSend__discardCachedRecognizer(void *a1, const char *a2, ...)
{
  return [a1 _discardCachedRecognizer];
}

id objc_msgSend__fidesEvalQueue(void *a1, const char *a2, ...)
{
  return [a1 _fidesEvalQueue];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return [a1 _invalidated];
}

id objc_msgSend__processBufferedAudioPackets(void *a1, const char *a2, ...)
{
  return [a1 _processBufferedAudioPackets];
}

id objc_msgSend__redecodeQueue(void *a1, const char *a2, ...)
{
  return [a1 _redecodeQueue];
}

id objc_msgSend__replaceCachedRecognizerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _replaceCachedRecognizerIfNeeded];
}

id objc_msgSend__sLowPrioritySerialQueue(void *a1, const char *a2, ...)
{
  return [a1 _sLowPrioritySerialQueue];
}

id objc_msgSend__scheduleCooldownTimer(void *a1, const char *a2, ...)
{
  return [a1 _scheduleCooldownTimer];
}

id objc_msgSend__sendPendingAnalyticsEvents(void *a1, const char *a2, ...)
{
  return [a1 _sendPendingAnalyticsEvents];
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return [a1 activeConfiguration];
}

id objc_msgSend_activeConfigurationForEverything(void *a1, const char *a2, ...)
{
  return [a1 activeConfigurationForEverything];
}

id objc_msgSend_activeConfigurationForNothing(void *a1, const char *a2, ...)
{
  return [a1 activeConfigurationForNothing];
}

id objc_msgSend_activeDictationLanguages(void *a1, const char *a2, ...)
{
  return [a1 activeDictationLanguages];
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return [a1 age];
}

id objc_msgSend_allItnRunIntervals(void *a1, const char *a2, ...)
{
  return [a1 allItnRunIntervals];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alternativesSelectedInfo(void *a1, const char *a2, ...)
{
  return [a1 alternativesSelectedInfo];
}

id objc_msgSend_aneContextFilter(void *a1, const char *a2, ...)
{
  return [a1 aneContextFilter];
}

id objc_msgSend_appendedAutoPunctuation(void *a1, const char *a2, ...)
{
  return [a1 appendedAutoPunctuation];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asrId(void *a1, const char *a2, ...)
{
  return [a1 asrId];
}

id objc_msgSend_asrSelfComponentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 asrSelfComponentIdentifier];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistantIsEnabled];
}

id objc_msgSend_bestLanguage(void *a1, const char *a2, ...)
{
  return [a1 bestLanguage];
}

id objc_msgSend_bluetoothDeviceIdFilter(void *a1, const char *a2, ...)
{
  return [a1 bluetoothDeviceIdFilter];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return [a1 callStackReturnAddresses];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancelRecognition(void *a1, const char *a2, ...)
{
  return [a1 cancelRecognition];
}

id objc_msgSend_captureESStartTimeInTicks(void *a1, const char *a2, ...)
{
  return [a1 captureESStartTimeInTicks];
}

id objc_msgSend_captureSnapshot(void *a1, const char *a2, ...)
{
  return [a1 captureSnapshot];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_censorSpeech(void *a1, const char *a2, ...)
{
  return [a1 censorSpeech];
}

id objc_msgSend_cleanupCacheAndReset(void *a1, const char *a2, ...)
{
  return [a1 cleanupCacheAndReset];
}

id objc_msgSend_cleanupUnusedSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 cleanupUnusedSubscriptions];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codec(void *a1, const char *a2, ...)
{
  return [a1 codec];
}

id objc_msgSend_component(void *a1, const char *a2, ...)
{
  return [a1 component];
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return [a1 components];
}

id objc_msgSend_concatenateUtterances(void *a1, const char *a2, ...)
{
  return [a1 concatenateUtterances];
}

id objc_msgSend_concatenatedAudioPackets(void *a1, const char *a2, ...)
{
  return [a1 concatenatedAudioPackets];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_containsEntity(void *a1, const char *a2, ...)
{
  return [a1 containsEntity];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextualData(void *a1, const char *a2, ...)
{
  return [a1 contextualData];
}

id objc_msgSend_continuousListening(void *a1, const char *a2, ...)
{
  return [a1 continuousListening];
}

id objc_msgSend_cooldownDisabledForDevice(void *a1, const char *a2, ...)
{
  return [a1 cooldownDisabledForDevice];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correctPartialResultIndexList(void *a1, const char *a2, ...)
{
  return [a1 correctPartialResultIndexList];
}

id objc_msgSend_correctedText(void *a1, const char *a2, ...)
{
  return [a1 correctedText];
}

id objc_msgSend_correctedTextV2(void *a1, const char *a2, ...)
{
  return [a1 correctedTextV2];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpuContextFilter(void *a1, const char *a2, ...)
{
  return [a1 cpuContextFilter];
}

id objc_msgSend_createPreheatFailedEvent(void *a1, const char *a2, ...)
{
  return [a1 createPreheatFailedEvent];
}

id objc_msgSend_createPreheatStartedOrChangedEvent(void *a1, const char *a2, ...)
{
  return [a1 createPreheatStartedOrChangedEvent];
}

id objc_msgSend_createSamplingDirectory(void *a1, const char *a2, ...)
{
  return [a1 createSamplingDirectory];
}

id objc_msgSend_cumulativeAudioDuration(void *a1, const char *a2, ...)
{
  return [a1 cumulativeAudioDuration];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataProfile(void *a1, const char *a2, ...)
{
  return [a1 dataProfile];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return [a1 dataType];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deliverEagerPackage(void *a1, const char *a2, ...)
{
  return [a1 deliverEagerPackage];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detectUtterances(void *a1, const char *a2, ...)
{
  return [a1 detectUtterances];
}

id objc_msgSend_deviceIdFilter(void *a1, const char *a2, ...)
{
  return [a1 deviceIdFilter];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 dictationIsEnabled];
}

id objc_msgSend_dictationUIInteractionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 dictationUIInteractionIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_disableDeliveringAsrFeatures(void *a1, const char *a2, ...)
{
  return [a1 disableDeliveringAsrFeatures];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_enableAutoPunctuation(void *a1, const char *a2, ...)
{
  return [a1 enableAutoPunctuation];
}

id objc_msgSend_enableEmojiRecognition(void *a1, const char *a2, ...)
{
  return [a1 enableEmojiRecognition];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_enableVoiceCommands(void *a1, const char *a2, ...)
{
  return [a1 enableVoiceCommands];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endAudio(void *a1, const char *a2, ...)
{
  return [a1 endAudio];
}

id objc_msgSend_ended(void *a1, const char *a2, ...)
{
  return [a1 ended];
}

id objc_msgSend_endpointStart(void *a1, const char *a2, ...)
{
  return [a1 endpointStart];
}

id objc_msgSend_exists(void *a1, const char *a2, ...)
{
  return [a1 exists];
}

id objc_msgSend_experimentIds(void *a1, const char *a2, ...)
{
  return [a1 experimentIds];
}

id objc_msgSend_failed(void *a1, const char *a2, ...)
{
  return [a1 failed];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_farField(void *a1, const char *a2, ...)
{
  return [a1 farField];
}

id objc_msgSend_farFieldFilter(void *a1, const char *a2, ...)
{
  return [a1 farFieldFilter];
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return [a1 fieldType];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstPartyContactWords(void *a1, const char *a2, ...)
{
  return [a1 firstPartyContactWords];
}

id objc_msgSend_firstResultAfterResume(void *a1, const char *a2, ...)
{
  return [a1 firstResultAfterResume];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_geoLmInitialized(void *a1, const char *a2, ...)
{
  return [a1 geoLmInitialized];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_gpuContextFilter(void *a1, const char *a2, ...)
{
  return [a1 gpuContextFilter];
}

id objc_msgSend_groupNameWords(void *a1, const char *a2, ...)
{
  return [a1 groupNameWords];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_handlePostUpgradeSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 handlePostUpgradeSubscriptions];
}

id objc_msgSend_hasData(void *a1, const char *a2, ...)
{
  return [a1 hasData];
}

id objc_msgSend_hasRecognizedAnything(void *a1, const char *a2, ...)
{
  return [a1 hasRecognizedAnything];
}

id objc_msgSend_hasSpaceAfter(void *a1, const char *a2, ...)
{
  return [a1 hasSpaceAfter];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incrementCost(void *a1, const char *a2, ...)
{
  return [a1 incrementCost];
}

id objc_msgSend_incrementDeletions(void *a1, const char *a2, ...)
{
  return [a1 incrementDeletions];
}

id objc_msgSend_incrementInsertions(void *a1, const char *a2, ...)
{
  return [a1 incrementInsertions];
}

id objc_msgSend_incrementSampledRequestCount(void *a1, const char *a2, ...)
{
  return [a1 incrementSampledRequestCount];
}

id objc_msgSend_incrementSubstitutions(void *a1, const char *a2, ...)
{
  return [a1 incrementSubstitutions];
}

id objc_msgSend_infersQoSFromInstanceUUIDForEAR(void *a1, const char *a2, ...)
{
  return [a1 infersQoSFromInstanceUUIDForEAR];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initUaapLm(void *a1, const char *a2, ...)
{
  return [a1 initUaapLm];
}

id objc_msgSend_initWithCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 initWithCurrentProcess];
}

id objc_msgSend_initializeSharedPowerLoggerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 initializeSharedPowerLoggerIfNeeded];
}

id objc_msgSend_inputOrigin(void *a1, const char *a2, ...)
{
  return [a1 inputOrigin];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionId(void *a1, const char *a2, ...)
{
  return [a1 interactionId];
}

id objc_msgSend_interactionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 interactionIdentifier];
}

id objc_msgSend_interpretationIndices(void *a1, const char *a2, ...)
{
  return [a1 interpretationIndices];
}

id objc_msgSend_interpretations(void *a1, const char *a2, ...)
{
  return [a1 interpretations];
}

id objc_msgSend_interruptTraining(void *a1, const char *a2, ...)
{
  return [a1 interruptTraining];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_ipaPhoneSequence(void *a1, const char *a2, ...)
{
  return [a1 ipaPhoneSequence];
}

id objc_msgSend_isBoosted(void *a1, const char *a2, ...)
{
  return [a1 isBoosted];
}

id objc_msgSend_isDictationHIPAACompliant(void *a1, const char *a2, ...)
{
  return [a1 isDictationHIPAACompliant];
}

id objc_msgSend_isEmojiDisambiguationUsed(void *a1, const char *a2, ...)
{
  return [a1 isEmojiDisambiguationUsed];
}

id objc_msgSend_isEmojiExpectedButNotRecognized(void *a1, const char *a2, ...)
{
  return [a1 isEmojiExpectedButNotRecognized];
}

id objc_msgSend_isEmojiPersonalizationUsed(void *a1, const char *a2, ...)
{
  return [a1 isEmojiPersonalizationUsed];
}

id objc_msgSend_isFinal(void *a1, const char *a2, ...)
{
  return [a1 isFinal];
}

id objc_msgSend_isModifiedByAutoPunctuation(void *a1, const char *a2, ...)
{
  return [a1 isModifiedByAutoPunctuation];
}

id objc_msgSend_isSiriXEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSiriXEnabled];
}

id objc_msgSend_isSpeechAPIRequest(void *a1, const char *a2, ...)
{
  return [a1 isSpeechAPIRequest];
}

id objc_msgSend_isTrialAssetDeliveryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTrialAssetDeliveryEnabled];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return [a1 isUIApplicationElement];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return [a1 itemType];
}

id objc_msgSend_itnDurationInNs(void *a1, const char *a2, ...)
{
  return [a1 itnDurationInNs];
}

id objc_msgSend_jitGrammar(void *a1, const char *a2, ...)
{
  return [a1 jitGrammar];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkId(void *a1, const char *a2, ...)
{
  return [a1 linkId];
}

id objc_msgSend_loadLmHandle(void *a1, const char *a2, ...)
{
  return [a1 loadLmHandle];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_logActiveConfigUpdateEnded(void *a1, const char *a2, ...)
{
  return [a1 logActiveConfigUpdateEnded];
}

id objc_msgSend_logAppleNeuralEngineModelInitializationEnded(void *a1, const char *a2, ...)
{
  return [a1 logAppleNeuralEngineModelInitializationEnded];
}

id objc_msgSend_logFirstAudioPacketProcessed(void *a1, const char *a2, ...)
{
  return [a1 logFirstAudioPacketProcessed];
}

id objc_msgSend_logFrameProcessingReady(void *a1, const char *a2, ...)
{
  return [a1 logFrameProcessingReady];
}

id objc_msgSend_logPartialResultGenerated(void *a1, const char *a2, ...)
{
  return [a1 logPartialResultGenerated];
}

id objc_msgSend_logPowerSnapshotForProcessEnded(void *a1, const char *a2, ...)
{
  return [a1 logPowerSnapshotForProcessEnded];
}

id objc_msgSend_logPowerSnapshotForProcessStarted(void *a1, const char *a2, ...)
{
  return [a1 logPowerSnapshotForProcessStarted];
}

id objc_msgSend_logSampledAudioFileStoredSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 logSampledAudioFileStoredSuccessfully];
}

id objc_msgSend_loggingContext(void *a1, const char *a2, ...)
{
  return [a1 loggingContext];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_markRecognition(void *a1, const char *a2, ...)
{
  return [a1 markRecognition];
}

id objc_msgSend_maximumRecognitionDuration(void *a1, const char *a2, ...)
{
  return [a1 maximumRecognitionDuration];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_modelInfo(void *a1, const char *a2, ...)
{
  return [a1 modelInfo];
}

id objc_msgSend_modelOverrideURL(void *a1, const char *a2, ...)
{
  return [a1 modelOverrideURL];
}

id objc_msgSend_modelRoot(void *a1, const char *a2, ...)
{
  return [a1 modelRoot];
}

id objc_msgSend_modelType(void *a1, const char *a2, ...)
{
  return [a1 modelType];
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return [a1 modelVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nBest(void *a1, const char *a2, ...)
{
  return [a1 nBest];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_narrowband(void *a1, const char *a2, ...)
{
  return [a1 narrowband];
}

id objc_msgSend_newRestrictedStreamDefaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 newRestrictedStreamDefaultConfiguration];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_noteSuccessfulUse(void *a1, const char *a2, ...)
{
  return [a1 noteSuccessfulUse];
}

id objc_msgSend_numberOfDeletions(void *a1, const char *a2, ...)
{
  return [a1 numberOfDeletions];
}

id objc_msgSend_numberOfInsertions(void *a1, const char *a2, ...)
{
  return [a1 numberOfInsertions];
}

id objc_msgSend_numberOfSubstitutions(void *a1, const char *a2, ...)
{
  return [a1 numberOfSubstitutions];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offlineDictationProfileOverridePath(void *a1, const char *a2, ...)
{
  return [a1 offlineDictationProfileOverridePath];
}

id objc_msgSend_oneBest(void *a1, const char *a2, ...)
{
  return [a1 oneBest];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_overrides(void *a1, const char *a2, ...)
{
  return [a1 overrides];
}

id objc_msgSend_packetReadyUpstreamTimeInTicks(void *a1, const char *a2, ...)
{
  return [a1 packetReadyUpstreamTimeInTicks];
}

id objc_msgSend_packetReceivedTime(void *a1, const char *a2, ...)
{
  return [a1 packetReceivedTime];
}

id objc_msgSend_packetReceivedTimeInTicks(void *a1, const char *a2, ...)
{
  return [a1 packetReceivedTimeInTicks];
}

id objc_msgSend_packetRecordedTimeInTicks(void *a1, const char *a2, ...)
{
  return [a1 packetRecordedTimeInTicks];
}

id objc_msgSend_packetTimestamps(void *a1, const char *a2, ...)
{
  return [a1 packetTimestamps];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pauseDurations(void *a1, const char *a2, ...)
{
  return [a1 pauseDurations];
}

id objc_msgSend_pauseRecognition(void *a1, const char *a2, ...)
{
  return [a1 pauseRecognition];
}

id objc_msgSend_phoneSequence(void *a1, const char *a2, ...)
{
  return [a1 phoneSequence];
}

id objc_msgSend_phrases(void *a1, const char *a2, ...)
{
  return [a1 phrases];
}

id objc_msgSend_postfixText(void *a1, const char *a2, ...)
{
  return [a1 postfixText];
}

id objc_msgSend_powerEventContext(void *a1, const char *a2, ...)
{
  return [a1 powerEventContext];
}

id objc_msgSend_powerSnapshot(void *a1, const char *a2, ...)
{
  return [a1 powerSnapshot];
}

id objc_msgSend_preITNRecognition(void *a1, const char *a2, ...)
{
  return [a1 preITNRecognition];
}

id objc_msgSend_preITNTokens(void *a1, const char *a2, ...)
{
  return [a1 preITNTokens];
}

id objc_msgSend_prefixText(void *a1, const char *a2, ...)
{
  return [a1 prefixText];
}

id objc_msgSend_preheatContext(void *a1, const char *a2, ...)
{
  return [a1 preheatContext];
}

id objc_msgSend_prepareToExit(void *a1, const char *a2, ...)
{
  return [a1 prepareToExit];
}

id objc_msgSend_prependedAutoPunctuation(void *a1, const char *a2, ...)
{
  return [a1 prependedAutoPunctuation];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return [a1 profile];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_qualify(void *a1, const char *a2, ...)
{
  return [a1 qualify];
}

id objc_msgSend_radioWords(void *a1, const char *a2, ...)
{
  return [a1 radioWords];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rawRecognition(void *a1, const char *a2, ...)
{
  return [a1 rawRecognition];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_recognition(void *a1, const char *a2, ...)
{
  return [a1 recognition];
}

id objc_msgSend_recognitionMetrics(void *a1, const char *a2, ...)
{
  return [a1 recognitionMetrics];
}

id objc_msgSend_recognitionPaused(void *a1, const char *a2, ...)
{
  return [a1 recognitionPaused];
}

id objc_msgSend_recognitionStart(void *a1, const char *a2, ...)
{
  return [a1 recognitionStart];
}

id objc_msgSend_recognitionStatistics(void *a1, const char *a2, ...)
{
  return [a1 recognitionStatistics];
}

id objc_msgSend_recognitionUtteranceInfos(void *a1, const char *a2, ...)
{
  return [a1 recognitionUtteranceInfos];
}

id objc_msgSend_recognitionUtterenceStatistics(void *a1, const char *a2, ...)
{
  return [a1 recognitionUtterenceStatistics];
}

id objc_msgSend_recognizedEmojis(void *a1, const char *a2, ...)
{
  return [a1 recognizedEmojis];
}

id objc_msgSend_recognizedText(void *a1, const char *a2, ...)
{
  return [a1 recognizedText];
}

id objc_msgSend_recognizedTextInfo(void *a1, const char *a2, ...)
{
  return [a1 recognizedTextInfo];
}

id objc_msgSend_refreshUnderstandingOnDeviceAssetsAvailableAsync(void *a1, const char *a2, ...)
{
  return [a1 refreshUnderstandingOnDeviceAssetsAvailableAsync];
}

id objc_msgSend_registerForegroundBundleIdentifiersUpdate(void *a1, const char *a2, ...)
{
  return [a1 registerForegroundBundleIdentifiersUpdate];
}

id objc_msgSend_registerNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerNotifications];
}

id objc_msgSend_releaseAssetSets(void *a1, const char *a2, ...)
{
  return [a1 releaseAssetSets];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllWords(void *a1, const char *a2, ...)
{
  return [a1 removeAllWords];
}

id objc_msgSend_repeatedStringValue(void *a1, const char *a2, ...)
{
  return [a1 repeatedStringValue];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_sampledCachesSubDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 sampledCachesSubDirectoryPath];
}

id objc_msgSend_samplingDateAsString(void *a1, const char *a2, ...)
{
  return [a1 samplingDateAsString];
}

id objc_msgSend_samplingRate(void *a1, const char *a2, ...)
{
  return [a1 samplingRate];
}

id objc_msgSend_samplingRateFilter(void *a1, const char *a2, ...)
{
  return [a1 samplingRateFilter];
}

id objc_msgSend_saveAudioToDisk(void *a1, const char *a2, ...)
{
  return [a1 saveAudioToDisk];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_secureOfflineOnly(void *a1, const char *a2, ...)
{
  return [a1 secureOfflineOnly];
}

id objc_msgSend_selectedText(void *a1, const char *a2, ...)
{
  return [a1 selectedText];
}

id objc_msgSend_selfHelper(void *a1, const char *a2, ...)
{
  return [a1 selfHelper];
}

id objc_msgSend_sendEvent(void *a1, const char *a2, ...)
{
  return [a1 sendEvent];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setQuasarLogLevelToSystemDefault(void *a1, const char *a2, ...)
{
  return [a1 setQuasarLogLevelToSystemDefault];
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sharedAnalytics];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedProfiler(void *a1, const char *a2, ...)
{
  return [a1 sharedProfiler];
}

id objc_msgSend_sharedStream(void *a1, const char *a2, ...)
{
  return [a1 sharedStream];
}

id objc_msgSend_shouldGenerateVoiceCommandCandidates(void *a1, const char *a2, ...)
{
  return [a1 shouldGenerateVoiceCommandCandidates];
}

id objc_msgSend_shouldHandleCapitalization(void *a1, const char *a2, ...)
{
  return [a1 shouldHandleCapitalization];
}

id objc_msgSend_signalEndOfUserData(void *a1, const char *a2, ...)
{
  return [a1 signalEndOfUserData];
}

id objc_msgSend_silenceStart(void *a1, const char *a2, ...)
{
  return [a1 silenceStart];
}

id objc_msgSend_siriDataSharingOptInStatus(void *a1, const char *a2, ...)
{
  return [a1 siriDataSharingOptInStatus];
}

id objc_msgSend_siriDataSharingOptedIn(void *a1, const char *a2, ...)
{
  return [a1 siriDataSharingOptedIn];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_speechCategoryName(void *a1, const char *a2, ...)
{
  return [a1 speechCategoryName];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startedOrChanged(void *a1, const char *a2, ...)
{
  return [a1 startedOrChanged];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopAudioDecoding(void *a1, const char *a2, ...)
{
  return [a1 stopAudioDecoding];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subscriberIdForDictationAssets(void *a1, const char *a2, ...)
{
  return [a1 subscriberIdForDictationAssets];
}

id objc_msgSend_supportedCategories(void *a1, const char *a2, ...)
{
  return [a1 supportedCategories];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_tagName(void *a1, const char *a2, ...)
{
  return [a1 tagName];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_taskName(void *a1, const char *a2, ...)
{
  return [a1 taskName];
}

id objc_msgSend_taskTypeFilter(void *a1, const char *a2, ...)
{
  return [a1 taskTypeFilter];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return [a1 tasks];
}

id objc_msgSend_templateToVersion(void *a1, const char *a2, ...)
{
  return [a1 templateToVersion];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thirdPartyContactWords(void *a1, const char *a2, ...)
{
  return [a1 thirdPartyContactWords];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_timestampInTicks(void *a1, const char *a2, ...)
{
  return [a1 timestampInTicks];
}

id objc_msgSend_tokenName(void *a1, const char *a2, ...)
{
  return [a1 tokenName];
}

id objc_msgSend_tokenSausage(void *a1, const char *a2, ...)
{
  return [a1 tokenSausage];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return [a1 tokens];
}

id objc_msgSend_totalCost(void *a1, const char *a2, ...)
{
  return [a1 totalCost];
}

id objc_msgSend_understandingOnDeviceAssetsAvailable(void *a1, const char *a2, ...)
{
  return [a1 understandingOnDeviceAssetsAvailable];
}

id objc_msgSend_unrepairedRecognition(void *a1, const char *a2, ...)
{
  return [a1 unrepairedRecognition];
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

id objc_msgSend_utteranceStart(void *a1, const char *a2, ...)
{
  return [a1 utteranceStart];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_vocabularyWords(void *a1, const char *a2, ...)
{
  return [a1 vocabularyWords];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return [a1 weight];
}

id objc_msgSend_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUaapOovsForLanguage:bundleId:customProns:newOovs:error:");
}