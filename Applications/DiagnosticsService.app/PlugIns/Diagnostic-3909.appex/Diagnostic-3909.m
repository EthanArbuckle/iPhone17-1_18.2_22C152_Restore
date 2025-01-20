void sub_10000379C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Block_object_dispose((const void *)(v29 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000037FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 acceleration];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v7 > *(double *)(v10 + 24)) {
      *(double *)(v10 + 24) = v7;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v7 < *(double *)(v11 + 24)) {
      *(double *)(v11 + 24) = v7;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 > *(double *)(v12 + 24)) {
      *(double *)(v12 + 24) = v8;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v8 < *(double *)(v13 + 24)) {
      *(double *)(v13 + 24) = v8;
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v9 > *(double *)(v14 + 24)) {
      *(double *)(v14 + 24) = v9;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    double v16 = *(double *)(v15 + 24);
    if (v9 < v16)
    {
      *(double *)(v15 + 24) = v9;
      double v16 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v18 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v19 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    double v20 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    double v21 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    double v22 = vabdd_f64(v17, v18);
    double v23 = vabdd_f64(v19, v20);
    double v24 = vabdd_f64(v21, v16);
    if (v23 < v24) {
      double v23 = v24;
    }
    if (v22 >= v23) {
      double v25 = v22;
    }
    else {
      double v25 = v23;
    }
    v26 = [*(id *)(a1 + 32) threshold];
    [v26 doubleValue];
    double v28 = v27;

    if (v25 > v28)
    {
      v29 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = [*(id *)(a1 + 32) threshold];
        [v33 doubleValue];
        v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v35 = +[NSNumber numberWithDouble:v17 - v18];
        v36 = +[NSNumber numberWithDouble:v19 - v20];
        v37 = +[NSNumber numberWithDouble:v21 - v16];
        int v38 = 138413058;
        v39 = v34;
        __int16 v40 = 2112;
        v41 = v35;
        __int16 v42 = 2112;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Motion detection threshold value %@ exceeded. X: %@ Y: %@ Z: %@", (uint8_t *)&v38, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      v30 = +[NSNotificationCenter defaultCenter];
      [v30 postNotificationName:@"MotionDetectedNotification" object:0];
    }
    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(unsigned char *)(v31 + 24))
    {
      *(unsigned char *)(v31 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0x10000000000000;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0x10000000000000;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x10000000000000;
    }
  }
  else
  {
    v32 = [*(id *)(a1 + 32) motionManager];
    [v32 stopAccelerometerUpdates];
  }
}

id *sub_100003E7C(id *result, void *a2)
{
  if (a2)
  {
    v2 = result;
    [a2 acceleration];
    double v4 = v3;
    double v6 = fabs(v5);
    double v7 = [v2[4] xThreshold];
    [v7 doubleValue];
    if (v6 > fabs(v8))
    {
    }
    else
    {
      double v9 = [v2[4] zThreshold];
      [v9 doubleValue];
      double v11 = fabs(v10);

      if (fabs(v4) <= v11) {
        return (id *)[v2[4] stop];
      }
    }
    uint64_t v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v2[4] xThreshold];
      [v14 doubleValue];
      double v16 = fabs(v15);
      double v17 = [v2[4] zThreshold];
      [v17 doubleValue];
      int v19 = 134219010;
      double v20 = v6;
      __int16 v21 = 2048;
      double v22 = fabs(v4);
      __int16 v23 = 2048;
      double v24 = v16;
      __int16 v25 = 2048;
      double v26 = fabs(v18);
      __int16 v27 = 2112;
      CFStringRef v28 = @"IncorrectOrientationNotification";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Gyroscope values { x: %f z: %f } are out of the thresholds allowed { x: %f z: %f }. Posting %@", (uint8_t *)&v19, 0x34u);
    }
    uint64_t v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:@"IncorrectOrientationNotification" object:0];

    return (id *)[v2[4] stop];
  }
  return result;
}

void sub_100004D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_100004D3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004D4C(uint64_t a1)
{
}

void sub_100004D54(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004E50(uint64_t a1)
{
  v2 = [DAAudioDevice alloc];
  double v3 = [*(id *)(a1 + 32) inputs];
  id v88 = 0;
  id v4 = -[DAAudioDevice initWithSequentialAudioInput:error:](v2, "initWithSequentialAudioInput:error:", [v3 sequentialAudioInput], &v88);
  id v5 = v88;
  [*(id *)(a1 + 32) setAudioDevice:v4];

  double v6 = [*(id *)(a1 + 32) audioDevice];

  if (v6)
  {
    double v7 = +[NSMutableArray array];
    [*(id *)(a1 + 32) setPlayResults:v7];

    v61 = +[NSMutableDictionary dictionary];
    double v8 = [*(id *)(a1 + 32) inputs];
    double v9 = [v8 audioFilesPerOutputComponent];
    id v10 = [v9 count];

    uint64_t v72 = a1;
    if (v10)
    {
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = [*(id *)(a1 + 32) inputs];
        uint64_t v13 = [v12 audioFilesPerOutputComponent];
        uint64_t v62 = v11;
        uint64_t v14 = [v13 objectAtIndexedSubscript:v11];

        if ([v14 count]) {
          break;
        }
        id v25 = v5;
LABEL_11:

        uint64_t v11 = v62 + 1;
        CFStringRef v28 = [*(id *)(a1 + 32) inputs];
        v29 = [v28 audioFilesPerOutputComponent];
        id v30 = [v29 count];

        id v5 = v25;
        if ((unint64_t)v30 <= v62 + 1) {
          goto LABEL_15;
        }
      }
      unint64_t v15 = 0;
      double v16 = v5;
      while (1)
      {
        if ([*(id *)(a1 + 32) isCancelled])
        {
          id v25 = v16;
          goto LABEL_48;
        }
        double v17 = [v14 objectAtIndex:v15];
        v66 = [*(id *)(a1 + 32) audioDevice];
        id v70 = [*(id *)(a1 + 32) fileNameToURL];
        id v68 = [v17 fileName];
        id obja = [v70 objectForKeyedSubscript:v68];
        double v18 = [v17 fileName];
        int v19 = [v17 volume];
        double v20 = [v17 channel];
        __int16 v21 = [*(id *)(v72 + 32) inputs];
        id v22 = [v21 sendRawData];
        id v87 = v16;
        [v66 playSignalFile:obja fileName:v18 fromOutput:v62 atVolume:v19 withChannel:v20 sendRawData:v22 error:&v87];
        v24 = __int16 v23 = v16;
        id v25 = v87;

        a1 = v72;
        double v26 = *(void **)(v72 + 32);
        if (!v24) {
          break;
        }
        __int16 v27 = [v26 playResults];
        [v27 addObject:v24];

        ++v15;
        double v16 = v25;
        if ((unint64_t)[v14 count] <= v15) {
          goto LABEL_11;
        }
      }
      [v26 failedToExecuteWithError:v25];

LABEL_48:
    }
    else
    {
      id v25 = v5;
LABEL_15:
      if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
      {
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id obj = [*(id *)(a1 + 32) playResults];
        id v58 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
        if (v58)
        {
          uint64_t v31 = *(void *)v84;
          uint64_t v57 = *(void *)v84;
LABEL_18:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v84 != v31)
            {
              uint64_t v33 = v32;
              objc_enumerationMutation(obj);
              uint64_t v32 = v33;
            }
            uint64_t v59 = v32;
            v34 = *(void **)(*((void *)&v83 + 1) + 8 * v32);
            long long v79 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v69 = v34;
            id v60 = [v69 countByEnumeratingWithState:&v79 objects:v92 count:16];
            if (v60)
            {
              uint64_t v67 = *(void *)v80;
LABEL_23:
              uint64_t v35 = 0;
              while (1)
              {
                if (*(void *)v80 != v67) {
                  objc_enumerationMutation(v69);
                }
                v36 = *(void **)(*((void *)&v79 + 1) + 8 * v35);
                long long v75 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                id v71 = v36;
                id v37 = [v71 countByEnumeratingWithState:&v75 objects:v91 count:16];
                if (v37)
                {
                  id v38 = v37;
                  uint64_t v39 = *(void *)v76;
                  uint64_t v63 = v35;
                  while (2)
                  {
                    __int16 v40 = 0;
                    v41 = v25;
                    do
                    {
                      if (*(void *)v76 != v39) {
                        objc_enumerationMutation(v71);
                      }
                      __int16 v42 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v40);
                      if ([*(id *)(a1 + 32) isCancelled])
                      {
                        id v25 = v41;
                        uint64_t v35 = v63;
                        goto LABEL_37;
                      }
                      id v74 = v41;
                      v43 = +[DAAudioCalculation calculateCrossCorrelation:v42 error:&v74];
                      id v25 = v74;

                      if (!v43)
                      {
                        [*(id *)(a1 + 32) failedToExecuteWithError:v25];

                        goto LABEL_49;
                      }
                      id v44 = v25;
                      id v45 = [v42 outputID];
                      id v46 = [v42 inputID];
                      v47 = [v42 fileName];
                      a1 = v72;
                      id v56 = v45;
                      id v25 = v44;
                      v48 = +[NSString stringWithFormat:@"%lu,%lu,%@", v56, v46, v47];

                      [v61 setObject:v43 forKey:v48];
                      __int16 v40 = (char *)v40 + 1;
                      v41 = v44;
                    }
                    while (v38 != v40);
                    id v38 = [v71 countByEnumeratingWithState:&v75 objects:v91 count:16];
                    uint64_t v35 = v63;
                    if (v38) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_37:

                if ([*(id *)(a1 + 32) isCancelled]) {
                  break;
                }
                if ((id)++v35 == v60)
                {
                  id v60 = [v69 countByEnumeratingWithState:&v79 objects:v92 count:16];
                  if (v60) {
                    goto LABEL_23;
                  }
                  break;
                }
              }
            }

            if ([*(id *)(a1 + 32) isCancelled]) {
              break;
            }
            uint64_t v32 = v59 + 1;
            uint64_t v31 = v57;
            if ((id)(v59 + 1) == v58)
            {
              id v49 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
              uint64_t v31 = v57;
              id v58 = v49;
              if (v49) {
                goto LABEL_18;
              }
              break;
            }
          }
        }

        if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
        {
          v50 = [v61 allKeys];
          id v51 = [v50 count];

          if (v51)
          {
            v52 = [*(id *)(a1 + 32) result];
            [v52 setStatusCode:&off_100010858];

            CFStringRef v89 = @"dbValues";
            v90 = v61;
            v53 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
            v54 = [*(id *)(a1 + 32) result];
            [v54 setData:v53];
          }
          else
          {
            id v73 = v25;
            +[LegacyAudioSystemController setCode:-60 forError:&v73];
            id v55 = v73;

            [*(id *)(a1 + 32) failedToExecuteWithError:v55];
            id v25 = v55;
          }
        }
        [*(id *)(a1 + 32) setFinished:1];
      }
    }
LABEL_49:
  }
  else
  {
    [*(id *)(a1 + 32) failedToExecuteWithError:v5];
    id v25 = v5;
  }
}

void sub_100007468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000772C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000077C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_100008200(uint64_t result, AudioUnitRenderActionFlags *a2, const AudioTimeStamp *a3, UInt32 a4, UInt32 a5)
{
  if (result) {
    return AudioUnitRender(*(AudioUnit *)(result + 80), a2, a3, a4, a5, *(AudioBufferList **)(result + 88));
  }
  return result;
}

uint64_t sub_100008214(void *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && *a2 == 8) {
    [a1 grabRecordedFrameData:a6 withNumberOfFrames:a5];
  }
  return 0;
}

uint64_t sub_10000824C(void *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && *a2 == 8) {
    [a1 grabPlayBackFrameData:a6 withNumberOfFrames:a5];
  }
  return 0;
}

BOOL sub_100008C54(id a1, id a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] && (unint64_t)[v2 length] < 0x101;

  return v3;
}

BOOL sub_100008CA4(id a1, id a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] && (unint64_t)[v2 length] < 0x33;

  return v3;
}

void sub_100008E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008E64(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((unint64_t)[v6 count] > 0x31)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    double v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008F94;
    v11[3] = &unk_1000104D8;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    id v13 = v7;
    uint64_t v14 = v9;
    id v12 = v8;
    id v10 = v7;
    [v6 enumerateObjectsUsingBlock:v11];
    [*(id *)(a1 + 40) addObject:v10];

    if (!a4) {
      goto LABEL_7;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
LABEL_7:
}

void sub_100008F94(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_opt_new();
    double v7 = [v10 dk_stringFromRequiredKey:@"name" inSet:*(void *)(a1 + 32) failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
    [v6 setFileName:v7];

    id v8 = [v10 dk_numberFromRequiredKey:@"volume" lowerBound:&off_100010900 upperBound:&off_100010910 failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
    [v6 setVolume:v8];

    uint64_t v9 = [v10 dk_numberFromKey:@"channel" lowerBound:&off_100010888 upperBound:&off_1000108A0 defaultValue:&off_100010888 failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
    [v6 setChannel:v9];

    [*(id *)(a1 + 40) addObject:v6];
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
LABEL_7:
}

void sub_100009768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009844(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

OSStatus AUGraphAddNode(AUGraph inGraph, const AudioComponentDescription *inDescription, AUNode *outNode)
{
  return _AUGraphAddNode(inGraph, inDescription, outNode);
}

OSStatus AUGraphConnectNodeInput(AUGraph inGraph, AUNode inSourceNode, UInt32 inSourceOutputNumber, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return _AUGraphConnectNodeInput(inGraph, inSourceNode, inSourceOutputNumber, inDestNode, inDestInputNumber);
}

OSStatus AUGraphInitialize(AUGraph inGraph)
{
  return _AUGraphInitialize(inGraph);
}

OSStatus AUGraphNodeInfo(AUGraph inGraph, AUNode inNode, AudioComponentDescription *outDescription, AudioUnit *outAudioUnit)
{
  return _AUGraphNodeInfo(inGraph, inNode, outDescription, outAudioUnit);
}

OSStatus AUGraphOpen(AUGraph inGraph)
{
  return _AUGraphOpen(inGraph);
}

OSStatus AUGraphStart(AUGraph inGraph)
{
  return _AUGraphStart(inGraph);
}

OSStatus AUGraphStop(AUGraph inGraph)
{
  return _AUGraphStop(inGraph);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return _AudioFileGetProperty(inAudioFile, inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return _AudioFileOpenURL(inFileRef, inPermissions, inFileTypeHint, outAudioFile);
}

OSStatus AudioUnitAddRenderNotify(AudioUnit inUnit, AURenderCallback inProc, void *inProcUserData)
{
  return _AudioUnitAddRenderNotify(inUnit, inProc, inProcUserData);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return _AudioUnitRender(inUnit, ioActionFlags, inTimeStamp, inOutputBusNumber, inNumberFrames, ioData);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return _AudioUnitReset(inUnit, inScope, inElement);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return _AudioUnitSetParameter(inUnit, inID, inScope, inElement, inValue, inBufferOffsetInFrames);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return _AudioUnitSetProperty(inUnit, inID, inScope, inElement, inData, inDataSize);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

OSStatus NewAUGraph(AUGraph *outGraph)
{
  return _NewAUGraph(outGraph);
}

uint64_t _AXSLeftRightAudioBalance()
{
  return __AXSLeftRightAudioBalance();
}

uint64_t _AXSMonoAudioEnabled()
{
  return __AXSMonoAudioEnabled();
}

uint64_t _AXSMonoAudioSetEnabled()
{
  return __AXSMonoAudioSetEnabled();
}

uint64_t _AXSSetLeftRightAudioBalance()
{
  return __AXSSetLeftRightAudioBalance();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

float log10f(float a1)
{
  return _log10f(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return [a1 acceleration];
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return [a1 accessoryDisconnectDetector];
}

id objc_msgSend_accessoryModelNumbers(void *a1, const char *a2, ...)
{
  return [a1 accessoryModelNumbers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_audioDevice(void *a1, const char *a2, ...)
{
  return [a1 audioDevice];
}

id objc_msgSend_audioFilesPerOutputComponent(void *a1, const char *a2, ...)
{
  return [a1 audioFilesPerOutputComponent];
}

id objc_msgSend_audioPlayingSemaphore(void *a1, const char *a2, ...)
{
  return [a1 audioPlayingSemaphore];
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return [a1 audioRouteChanged];
}

id objc_msgSend_audioSessionInterruptDetector(void *a1, const char *a2, ...)
{
  return [a1 audioSessionInterruptDetector];
}

id objc_msgSend_availableInputs(void *a1, const char *a2, ...)
{
  return [a1 availableInputs];
}

id objc_msgSend_balanceChanged(void *a1, const char *a2, ...)
{
  return [a1 balanceChanged];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_cleanUpPlayResults(void *a1, const char *a2, ...)
{
  return [a1 cleanUpPlayResults];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_confirmDeviceDocked(void *a1, const char *a2, ...)
{
  return [a1 confirmDeviceDocked];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_dataSourceID(void *a1, const char *a2, ...)
{
  return [a1 dataSourceID];
}

id objc_msgSend_dataSources(void *a1, const char *a2, ...)
{
  return [a1 dataSources];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_diagnosticResponder(void *a1, const char *a2, ...)
{
  return [a1 diagnosticResponder];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endAudioTestCase(void *a1, const char *a2, ...)
{
  return [a1 endAudioTestCase];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_fileNameToURL(void *a1, const char *a2, ...)
{
  return [a1 fileNameToURL];
}

id objc_msgSend_fileTimeInFrames(void *a1, const char *a2, ...)
{
  return [a1 fileTimeInFrames];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_freeReceivedData(void *a1, const char *a2, ...)
{
  return [a1 freeReceivedData];
}

id objc_msgSend_freeSourceData(void *a1, const char *a2, ...)
{
  return [a1 freeSourceData];
}

id objc_msgSend_getBandPassDescription(void *a1, const char *a2, ...)
{
  return [a1 getBandPassDescription];
}

id objc_msgSend_getBasicStreamDescription(void *a1, const char *a2, ...)
{
  return [a1 getBasicStreamDescription];
}

id objc_msgSend_getGeneratorDescription(void *a1, const char *a2, ...)
{
  return [a1 getGeneratorDescription];
}

id objc_msgSend_getMixerDescription(void *a1, const char *a2, ...)
{
  return [a1 getMixerDescription];
}

id objc_msgSend_getRemoteIODescription(void *a1, const char *a2, ...)
{
  return [a1 getRemoteIODescription];
}

id objc_msgSend_headphoneDetector(void *a1, const char *a2, ...)
{
  return [a1 headphoneDetector];
}

id objc_msgSend_inputID(void *a1, const char *a2, ...)
{
  return [a1 inputID];
}

id objc_msgSend_inputNumberOfChannels(void *a1, const char *a2, ...)
{
  return [a1 inputNumberOfChannels];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerActive];
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerAvailable];
}

id objc_msgSend_isBalanceChangeRequired(void *a1, const char *a2, ...)
{
  return [a1 isBalanceChangeRequired];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDockRequired(void *a1, const char *a2, ...)
{
  return [a1 isDockRequired];
}

id objc_msgSend_isHeadphonesConnected(void *a1, const char *a2, ...)
{
  return [a1 isHeadphonesConnected];
}

id objc_msgSend_isMonoChangeRequired(void *a1, const char *a2, ...)
{
  return [a1 isMonoChangeRequired];
}

id objc_msgSend_isOriginallyMono(void *a1, const char *a2, ...)
{
  return [a1 isOriginallyMono];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_makeSignalsDataObjects(void *a1, const char *a2, ...)
{
  return [a1 makeSignalsDataObjects];
}

id objc_msgSend_maximumDelay(void *a1, const char *a2, ...)
{
  return [a1 maximumDelay];
}

id objc_msgSend_minimumDelay(void *a1, const char *a2, ...)
{
  return [a1 minimumDelay];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return [a1 modelNumbers];
}

id objc_msgSend_monoChanged(void *a1, const char *a2, ...)
{
  return [a1 monoChanged];
}

id objc_msgSend_motionDetector(void *a1, const char *a2, ...)
{
  return [a1 motionDetector];
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return [a1 motionManager];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numInputs(void *a1, const char *a2, ...)
{
  return [a1 numInputs];
}

id objc_msgSend_numberOfInputComponents(void *a1, const char *a2, ...)
{
  return [a1 numberOfInputComponents];
}

id objc_msgSend_orientationDetector(void *a1, const char *a2, ...)
{
  return [a1 orientationDetector];
}

id objc_msgSend_originalBalance(void *a1, const char *a2, ...)
{
  return [a1 originalBalance];
}

id objc_msgSend_outputID(void *a1, const char *a2, ...)
{
  return [a1 outputID];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_playAndRecord(void *a1, const char *a2, ...)
{
  return [a1 playAndRecord];
}

id objc_msgSend_playAndRecordFinished(void *a1, const char *a2, ...)
{
  return [a1 playAndRecordFinished];
}

id objc_msgSend_playFrameCount(void *a1, const char *a2, ...)
{
  return [a1 playFrameCount];
}

id objc_msgSend_playResults(void *a1, const char *a2, ...)
{
  return [a1 playResults];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_previousDeviceVolumeAudioVideo(void *a1, const char *a2, ...)
{
  return [a1 previousDeviceVolumeAudioVideo];
}

id objc_msgSend_previousDeviceVolumePlayAndRecord(void *a1, const char *a2, ...)
{
  return [a1 previousDeviceVolumePlayAndRecord];
}

id objc_msgSend_receivedSignal(void *a1, const char *a2, ...)
{
  return [a1 receivedSignal];
}

id objc_msgSend_recordFrameCount(void *a1, const char *a2, ...)
{
  return [a1 recordFrameCount];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_requiredFiles(void *a1, const char *a2, ...)
{
  return [a1 requiredFiles];
}

id objc_msgSend_resetToPreviousVolume(void *a1, const char *a2, ...)
{
  return [a1 resetToPreviousVolume];
}

id objc_msgSend_restoreAccesibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return [a1 restoreAccesibilityStateIfRequired];
}

id objc_msgSend_restoreOriginalVolumes(void *a1, const char *a2, ...)
{
  return [a1 restoreOriginalVolumes];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_saveOriginalVolumes(void *a1, const char *a2, ...)
{
  return [a1 saveOriginalVolumes];
}

id objc_msgSend_sendRawData(void *a1, const char *a2, ...)
{
  return [a1 sendRawData];
}

id objc_msgSend_sequentialAudioInput(void *a1, const char *a2, ...)
{
  return [a1 sequentialAudioInput];
}

id objc_msgSend_setAccessibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityStateIfRequired];
}

id objc_msgSend_setUpEventNotifications(void *a1, const char *a2, ...)
{
  return [a1 setUpEventNotifications];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sourceSignal(void *a1, const char *a2, ...)
{
  return [a1 sourceSignal];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAudioTestCase(void *a1, const char *a2, ...)
{
  return [a1 startAudioTestCase];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopAccelerometerUpdates];
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return [a1 threshold];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_volumeNeedsReset(void *a1, const char *a2, ...)
{
  return [a1 volumeNeedsReset];
}

id objc_msgSend_xComponentAccelThreshold(void *a1, const char *a2, ...)
{
  return [a1 xComponentAccelThreshold];
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return [a1 xThreshold];
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return [a1 zThreshold];
}