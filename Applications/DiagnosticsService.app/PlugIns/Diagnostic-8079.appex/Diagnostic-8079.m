BOOL sub_1000023A0(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = [v2 length] && (unint64_t)[v2 length] < 0x101;

  return v3;
}

BOOL sub_1000023F0(id a1, id a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] && (unint64_t)[v2 length] < 0x33;

  return v3;
}

void sub_100002618(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100002634(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8) + 24;
  id v5 = a2;
  [v3 dk_numberFromRequiredKey:v5 lowerBound:&off_100010F58 upperBound:&off_100010F70 failed:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [*(id *)(a1 + 40) inputValueToName];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void sub_1000026DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000027DC;
  v10[3] = &unk_100010400;
  v11 = objc_alloc_init(OutputSpecification);
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 40);
  id v7 = v5;
  v8 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  v9 = [*(id *)(a1 + 32) outputSpecifications];
  [v9 setObject:v8 forKeyedSubscript:v6];
}

void sub_1000027DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) dk_numberFromRequiredKey:@"mode" lowerBound:&off_100010F58 upperBound:&off_100010F88 failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  [*(id *)(a1 + 32) setMode:v2];

  [*(id *)(a1 + 40) dk_numberFromRequiredKey:@"channel" lowerBound:&off_100010F58 upperBound:&off_100010F88 failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setChannel:v3];
}

id *sub_100002D60(id *result, void *a2)
{
  if (a2)
  {
    id v2 = result;
    [a2 acceleration];
    double v4 = v3;
    double v6 = fabs(v5);
    id v7 = [v2[4] xThreshold];
    [v7 doubleValue];
    if (v6 > fabs(v8))
    {
    }
    else
    {
      v9 = [v2[4] zThreshold];
      [v9 doubleValue];
      double v11 = fabs(v10);

      if (fabs(v4) <= v11) {
        return (id *)[v2[4] stop];
      }
    }
    id v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v2[4] xThreshold];
      [v14 doubleValue];
      double v16 = fabs(v15);
      v17 = [v2[4] zThreshold];
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

void sub_1000032F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Block_object_dispose((const void *)(v29 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100003358(uint64_t a1, void *a2, void *a3)
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
    double v26 = [*(id *)(a1 + 32) threshold];
    [v26 doubleValue];
    double v28 = v27;

    if (v25 > v28)
    {
      uint64_t v29 = DiagnosticLogHandleForCategory();
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

id archiveFiles(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = +[DSMutableArchive archive];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v7;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v13);
        id v24 = v14;
        unsigned __int8 v16 = [v8 addURL:v15 error:&v24];
        id v7 = v24;

        if ((v16 & 1) == 0)
        {
          double v21 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_100008ED8((uint64_t)v7, v21);
          }

          double v20 = v9;
          goto LABEL_15;
        }
        uint64_t v13 = (char *)v13 + 1;
        uint64_t v14 = v7;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  double v17 = v7;

  double v18 = DKTemporaryDirectoryURL();
  id v23 = v7;
  double v19 = [v8 archiveAsTempFileWithTemplate:v6 directory:v18 suffix:@".tar.gz" error:&v23];
  id v7 = v23;

  if (!v19)
  {
    double v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100008E60((uint64_t)v7, v20);
    }
LABEL_15:

    double v19 = 0;
  }

  return v19;
}

void sub_100004F64(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [*(id *)(a1 + 32) setAudioSystemResults:v2];

  dsema = dispatch_semaphore_create(0);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  double v3 = [*(id *)(a1 + 32) inputs];
  double v4 = [v3 sequences];

  id v5 = [v4 countByEnumeratingWithState:&v81 objects:v97 count:16];
  if (v5)
  {
    id v6 = v5;
    v70 = 0;
    uint64_t v7 = *(void *)v82;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v82 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) testFailed])
        {
          dispatch_semaphore_signal(dsema);
        }
        else
        {
          id v10 = [v9 outputs];
          id v11 = [v10 count];

          if (v11 == (id)1)
          {
            [*(id *)(a1 + 32) testSequence:v9 completionSemaphore:dsema];
          }
          else
          {
            NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
            CFStringRef v96 = @"Sequence has more than 1 output.";
            uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
            uint64_t v13 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-64 userInfo:v12];

            [*(id *)(a1 + 32) failedToExecuteWithError:v13];
            dispatch_semaphore_signal(dsema);
            v70 = (void *)v13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v81 objects:v97 count:16];
    }
    while (v6);
  }
  else
  {
    v70 = 0;
  }

  uint64_t v14 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Waiting for sequences to complete...", buf, 2u);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) inputs];
  unsigned __int8 v16 = [v15 sequences];

  double v17 = (char *)[v16 countByEnumeratingWithState:&v77 objects:v94 count:16];
  if (!v17)
  {
LABEL_28:

    long long v27 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "All sequences complete", buf, 2u);
    }

    id v28 = v70;
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v29 = [*(id *)(a1 + 32) rawRecordings];
      v30 = [@"RecordedAudio" stringByAppendingString:@"XXXXXX"];
      unsigned __int8 v16 = archiveFiles(v29, v30, v70);

      uint64_t v31 = DiagnosticLogHandleForCategory();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v70)
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          v93 = (const char *)v70;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "ERROR archiving recording data: %@", buf, 0xCu);
        }
      }
      else
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          v93 = (const char *)v16;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully archived raw audio to [%@]", buf, 0xCu);
        }

        uint64_t v31 = objc_alloc_init((Class)NSFileManager);
        v35 = [*(id *)(a1 + 32) tmpdir];
        v36 = [@"RecordedAudio" stringByAppendingString:@".tar.gz"];
        v37 = [v35 URLByAppendingPathComponent:v36];

        id v76 = 0;
        unsigned int v38 = [v31 moveItemAtURL:v16 toURL:v37 error:&v76];
        id v28 = v76;
        v39 = DiagnosticLogHandleForCategory();
        __int16 v40 = v39;
        if (v38)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v93 = v37;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Successfully renamed raw audio archive to [%@]", buf, 0xCu);
          }

          __int16 v40 = v16;
          unsigned __int8 v16 = v37;
        }
        else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          sub_100008FB8();
        }
      }
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
    if ([*(id *)(a1 + 32) isCancelled]) {
      goto LABEL_78;
    }
    if (([*(id *)(a1 + 32) testFailed] & 1) == 0)
    {
      v41 = [*(id *)(a1 + 32) result];
      [v41 setStatusCode:&off_100010FA0];
    }
    CFStringRef v88 = @"dbResults";
    __int16 v42 = [*(id *)(a1 + 32) audioSystemResults];
    v89 = v42;
    v43 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    __int16 v44 = [*(id *)(a1 + 32) result];
    [v44 setData:v43];

    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_78;
    }
    v45 = v16;
    id v46 = v28;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v47 = [*(id *)(a1 + 32) inputs];
    v48 = [v47 sequences];

    id v49 = [v48 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v49)
    {
      id v50 = v49;
      v51 = 0;
      uint64_t v52 = *(void *)v73;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(void *)v73 != v52) {
            objc_enumerationMutation(v48);
          }
          v54 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)j) completedResultCount];
          v51 += (int)[v54 intValue];
        }
        id v50 = [v48 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v50);
    }
    else
    {
      v51 = 0;
    }

    if (v45
      && ([*(id *)(a1 + 32) rawRecordings],
          v55 = objc_claimAutoreleasedReturnValue(),
          v56 = (char *)[v55 count],
          v55,
          v56 == v51))
    {
      uint64_t v57 = [*(id *)(a1 + 32) writeCurrentResultsToJson];
      v58 = (void *)v57;
      id v28 = v46;
      if (v57)
      {
        v86[0] = v45;
        v86[1] = v57;
        v59 = +[NSArray arrayWithObjects:v86 count:2];
        v60 = [*(id *)(a1 + 32) archiveNameTemplate];
        archiveFiles(v59, v60, v28);
        v61 = (char *)objc_claimAutoreleasedReturnValue();

        v62 = DiagnosticLogHandleForCategory();
        v63 = v62;
        if (v28)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
            sub_100008F50();
          }
        }
        else
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v93 = v61;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Successfully created combined results archive at [%@]", buf, 0xCu);
          }

          v85 = v61;
          v63 = +[NSArray arrayWithObjects:&v85 count:1];
          v68 = [*(id *)(a1 + 32) result];
          [v68 setFiles:v63];
        }
        unsigned __int8 v16 = v45;
      }
      else
      {
        v64 = DiagnosticLogHandleForCategory();
        unsigned __int8 v16 = v45;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Unable to include test results in archive. Prioritizing Kets over recorded audio", buf, 2u);
        }

        v65 = [*(id *)(a1 + 32) result];
        v66 = [v65 statusCode];
        unsigned int v67 = [v66 isEqualToNumber:&off_100010FA0];

        if (!v67) {
          goto LABEL_77;
        }
        v61 = [*(id *)(a1 + 32) result];
        [v61 setStatusCode:&off_100010FB8];
      }
    }
    else
    {
      v58 = [*(id *)(a1 + 32) result];
      [v58 setStatusCode:&off_100010FB8];
      id v28 = v46;
      unsigned __int8 v16 = v45;
    }
LABEL_77:

LABEL_78:
    [*(id *)(a1 + 32) testFinishedSuccessfully];
    goto LABEL_79;
  }
  double v19 = v17;
  uint64_t v20 = *(void *)v78;
  *(void *)&long long v18 = 136315138;
  long long v69 = v18;
  while (1)
  {
    if (*(void *)v78 != v20) {
      objc_enumerationMutation(v16);
    }
    double v21 = [*(id *)(a1 + 32) inputs:v69];
    double v22 = [v21 sequenceTimeout];
    dispatch_time_t v23 = dispatch_time(0, 1000000000 * (void)[v22 unsignedLongValue]);
    intptr_t v24 = dispatch_semaphore_wait(dsema, v23);

    long long v25 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = "timed out";
      if (!v24) {
        long long v26 = "finished";
      }
      *(_DWORD *)buf = v69;
      v93 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sequence has %s while waiting for completion.", buf, 0xCu);
    }

    if (v24) {
      break;
    }
    if (!--v19)
    {
      double v19 = (char *)[v16 countByEnumeratingWithState:&v77 objects:v94 count:16];
      if (!v19) {
        goto LABEL_28;
      }
    }
  }
  v33 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Timed out while waiting on sequence completion semaphore. Ending test.", buf, 2u);
  }

  NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
  CFStringRef v91 = @"Timed out waiting for sequences to finish running.";
  v34 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  id v28 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-71 userInfo:v34];

  [*(id *)(a1 + 32) failedToExecuteWithError:v28];
  [*(id *)(a1 + 32) setFinished:1];
LABEL_79:
}

void sub_100005D04(uint64_t a1)
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "This is the first time failedToExecuteWithError was called. Using this error for the failing status code", v7, 2u);
  }

  double v3 = [*(id *)(a1 + 32) result];
  [v3 setData:&__NSDictionary0__struct];

  double v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) code]);
  id v5 = [*(id *)(a1 + 32) result];
  [v5 setStatusCode:v4];

  [*(id *)(a1 + 32) setTestFailed:1];
  id v6 = [*(id *)(a1 + 32) audioTest];
  [v6 cancel];
}

void sub_100006A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100006A74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006A84(uint64_t a1)
{
}

void sub_100006A8C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006F40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) testFailed])
  {
    uint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v8;
      double v9 = "Test appears to have already failed. Not proceeding with completion block for sequence {%@}";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v5)
  {
    if ([v5 count])
    {
      id v10 = objc_alloc_init((Class)NSMutableArray);
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = [*(id *)(a1 + 72) index];
      [v11 parseTestResults:v5 fromOutput:v12 withFile:v13 parsedResults:v10 sequenceIndex:v14 error:v6];

      uint64_t v15 = [*(id *)(a1 + 32) audioSystemResults];
      [v15 addObject:v10];

      unsigned __int8 v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
      [*(id *)(a1 + 72) setCompletedResultCount:v16];

      goto LABEL_7;
    }
LABEL_27:
    intptr_t v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10000911C(a1, v24, v25, v26, v27, v28, v29, v30);
    }

    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Sequence completed with no results";
    uint64_t v31 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    BOOL v32 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-72 userInfo:v31];

    [*(id *)(a1 + 32) failedToExecuteWithError:v32];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

    goto LABEL_11;
  }
  long long v18 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000091F4();
  }

  if (v6)
  {
    if ([v6 code] == (id)-2 || objc_msgSend(v6, "code") == (id)-3)
    {
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      double v19 = [v6 localizedDescription];
      __int16 v40 = v19;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v21 = -56;
    }
    else
    {
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      double v19 = [v6 localizedDescription];
      unsigned int v38 = v19;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      uint64_t v21 = -67;
    }
    double v22 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:v21 userInfo:v20];
  }
  else
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    CFStringRef v36 = @"Sequence completed with nil result";
    double v19 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    double v22 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-72 userInfo:v19];
  }

  if (!v22)
  {
    if ([0 count])
    {
      [*(id *)(a1 + 72) setCompletedResultCount:&off_100010FD0];
LABEL_7:
      uint64_t v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v17;
        double v9 = "Completion finished for test sequence %@";
        goto LABEL_9;
      }
LABEL_10:

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  dispatch_time_t v23 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10000918C();
  }

  [*(id *)(a1 + 32) failedToExecuteWithError:v22];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

LABEL_11:
}

void sub_100008BB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008BE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100008BFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008E60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR archiving logs: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100008ED8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR finding log(s): %@", (uint8_t *)&v2, 0xCu);
}

void sub_100008F50()
{
  sub_100008BD4();
  sub_100008BB8((void *)&_mh_execute_header, v0, v1, "Failed to create combined results archive with error [%@]", v2, v3, v4, v5, v6);
}

void sub_100008FB8()
{
  sub_100008BD4();
  sub_100008BB8((void *)&_mh_execute_header, v0, v1, "Failed to rename raw audio archive. Will use existing name in upload. Error: [%@]", v2, v3, v4, v5, v6);
}

void sub_100009020(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Error clearing temporary files: %@", a1, 0xCu);
}

void sub_100009098(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_100008BD4();
  sub_100008BFC((void *)&_mh_execute_header, v2, v3, "Error clearing temporary files: %@", v4, v5, v6, v7, v8);
}

void sub_10000911C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000918C()
{
  sub_100008BD4();
  sub_100008BB8((void *)&_mh_execute_header, v0, v1, "AVF audio playback error resolved to: %@", v2, v3, v4, v5, v6);
}

void sub_1000091F4()
{
  sub_100008BD4();
  sub_100008BB8((void *)&_mh_execute_header, v0, v1, "ERROR during audio playback: %@", v2, v3, v4, v5, v6);
}

void sub_10000925C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 outputDevice];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Sample rate mismatch between audio file %@ and speaker %@", (uint8_t *)&v6, 0x16u);
}

void sub_100009310(void *a1)
{
  [a1 inputID];
  sub_100008BD4();
  sub_100008BFC((void *)&_mh_execute_header, v1, v2, "Input name missing for mic %ld", v3, v4, v5, v6, v7);
}

void sub_100009388(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000093C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000093F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t DKTemporaryDirectoryURL()
{
  return _DKTemporaryDirectoryURL();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
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

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return [a1 acceleration];
}

id objc_msgSend_accessoryDetectorModelNumbers(void *a1, const char *a2, ...)
{
  return [a1 accessoryDetectorModelNumbers];
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return [a1 accessoryDisconnectDetector];
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return [a1 archive];
}

id objc_msgSend_archiveNameTemplate(void *a1, const char *a2, ...)
{
  return [a1 archiveNameTemplate];
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return [a1 audioRouteChanged];
}

id objc_msgSend_audioSystemResultClass(void *a1, const char *a2, ...)
{
  return [a1 audioSystemResultClass];
}

id objc_msgSend_audioSystemResults(void *a1, const char *a2, ...)
{
  return [a1 audioSystemResults];
}

id objc_msgSend_audioTest(void *a1, const char *a2, ...)
{
  return [a1 audioTest];
}

id objc_msgSend_avAudioDeviceTestClass(void *a1, const char *a2, ...)
{
  return [a1 avAudioDeviceTestClass];
}

id objc_msgSend_avAudioDeviceTestSequenceClass(void *a1, const char *a2, ...)
{
  return [a1 avAudioDeviceTestSequenceClass];
}

id objc_msgSend_balanceChanged(void *a1, const char *a2, ...)
{
  return [a1 balanceChanged];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calculateCrossCorrelationPeak(void *a1, const char *a2, ...)
{
  return [a1 calculateCrossCorrelationPeak];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedResultCount(void *a1, const char *a2, ...)
{
  return [a1 completedResultCount];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correlationValue(void *a1, const char *a2, ...)
{
  return [a1 correlationValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dbValue(void *a1, const char *a2, ...)
{
  return [a1 dbValue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteTemporaryFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteTemporaryFiles];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_diagnosticResponder(void *a1, const char *a2, ...)
{
  return [a1 diagnosticResponder];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fileDownloadTimeout(void *a1, const char *a2, ...)
{
  return [a1 fileDownloadTimeout];
}

id objc_msgSend_fileNameToURL(void *a1, const char *a2, ...)
{
  return [a1 fileNameToURL];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatChannelData(void *a1, const char *a2, ...)
{
  return [a1 floatChannelData];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return [a1 frameLength];
}

id objc_msgSend_headphoneDetector(void *a1, const char *a2, ...)
{
  return [a1 headphoneDetector];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return [a1 input];
}

id objc_msgSend_inputID(void *a1, const char *a2, ...)
{
  return [a1 inputID];
}

id objc_msgSend_inputValueToName(void *a1, const char *a2, ...)
{
  return [a1 inputValueToName];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerActive];
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerAvailable];
}

id objc_msgSend_isAccessoryDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isAccessoryDetectorActive];
}

id objc_msgSend_isBalanceChangeRequired(void *a1, const char *a2, ...)
{
  return [a1 isBalanceChangeRequired];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDeviceConnectedToAccessory(void *a1, const char *a2, ...)
{
  return [a1 isDeviceConnectedToAccessory];
}

id objc_msgSend_isDeviceWatch(void *a1, const char *a2, ...)
{
  return [a1 isDeviceWatch];
}

id objc_msgSend_isDeviceiPad(void *a1, const char *a2, ...)
{
  return [a1 isDeviceiPad];
}

id objc_msgSend_isDeviceiPhone(void *a1, const char *a2, ...)
{
  return [a1 isDeviceiPhone];
}

id objc_msgSend_isDeviceiPod(void *a1, const char *a2, ...)
{
  return [a1 isDeviceiPod];
}

id objc_msgSend_isHeadphonesDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isHeadphonesDetectorActive];
}

id objc_msgSend_isMonoChangeRequired(void *a1, const char *a2, ...)
{
  return [a1 isMonoChangeRequired];
}

id objc_msgSend_isMotionDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isMotionDetectorActive];
}

id objc_msgSend_isOrientationDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isOrientationDetectorActive];
}

id objc_msgSend_isOriginallyMono(void *a1, const char *a2, ...)
{
  return [a1 isOriginallyMono];
}

id objc_msgSend_isOtherAudioPlaying(void *a1, const char *a2, ...)
{
  return [a1 isOtherAudioPlaying];
}

id objc_msgSend_isSoundRecognitionRequired(void *a1, const char *a2, ...)
{
  return [a1 isSoundRecognitionRequired];
}

id objc_msgSend_isUsingDBValuesFromSystem(void *a1, const char *a2, ...)
{
  return [a1 isUsingDBValuesFromSystem];
}

id objc_msgSend_isUsingMeasurementMode(void *a1, const char *a2, ...)
{
  return [a1 isUsingMeasurementMode];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
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

id objc_msgSend_motionDetectorThreshold(void *a1, const char *a2, ...)
{
  return [a1 motionDetectorThreshold];
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return [a1 motionManager];
}

id objc_msgSend_mutableAudioBufferList(void *a1, const char *a2, ...)
{
  return [a1 mutableAudioBufferList];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_orientationDetector(void *a1, const char *a2, ...)
{
  return [a1 orientationDetector];
}

id objc_msgSend_orientationDetectorXThreshold(void *a1, const char *a2, ...)
{
  return [a1 orientationDetectorXThreshold];
}

id objc_msgSend_orientationDetectorZThreshold(void *a1, const char *a2, ...)
{
  return [a1 orientationDetectorZThreshold];
}

id objc_msgSend_originalBalance(void *a1, const char *a2, ...)
{
  return [a1 originalBalance];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_outputDevice(void *a1, const char *a2, ...)
{
  return [a1 outputDevice];
}

id objc_msgSend_outputSpecifications(void *a1, const char *a2, ...)
{
  return [a1 outputSpecifications];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_outputsClass(void *a1, const char *a2, ...)
{
  return [a1 outputsClass];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_previousAudioChanged(void *a1, const char *a2, ...)
{
  return [a1 previousAudioChanged];
}

id objc_msgSend_previousDeviceVolumeAudioVideo(void *a1, const char *a2, ...)
{
  return [a1 previousDeviceVolumeAudioVideo];
}

id objc_msgSend_previousDeviceVolumePlayAndRecord(void *a1, const char *a2, ...)
{
  return [a1 previousDeviceVolumePlayAndRecord];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return [a1 processingFormat];
}

id objc_msgSend_rawRecordings(void *a1, const char *a2, ...)
{
  return [a1 rawRecordings];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
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

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_saveOriginalVolumes(void *a1, const char *a2, ...)
{
  return [a1 saveOriginalVolumes];
}

id objc_msgSend_saveRawRecording(void *a1, const char *a2, ...)
{
  return [a1 saveRawRecording];
}

id objc_msgSend_sequenceTimeout(void *a1, const char *a2, ...)
{
  return [a1 sequenceTimeout];
}

id objc_msgSend_sequences(void *a1, const char *a2, ...)
{
  return [a1 sequences];
}

id objc_msgSend_setAccessibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityStateIfRequired];
}

id objc_msgSend_setUpEventNotifications(void *a1, const char *a2, ...)
{
  return [a1 setUpEventNotifications];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
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

id objc_msgSend_soundDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionEnabled];
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionState];
}

id objc_msgSend_soundRecognitionChanged(void *a1, const char *a2, ...)
{
  return [a1 soundRecognitionChanged];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return [a1 sources];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopAccelerometerUpdates];
}

id objc_msgSend_systemSoundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 systemSoundDetectionState];
}

id objc_msgSend_testFailed(void *a1, const char *a2, ...)
{
  return [a1 testFailed];
}

id objc_msgSend_testFinishedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 testFinishedSuccessfully];
}

id objc_msgSend_testID(void *a1, const char *a2, ...)
{
  return [a1 testID];
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return [a1 threshold];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_tmpdir(void *a1, const char *a2, ...)
{
  return [a1 tmpdir];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validOutputDeviceSet(void *a1, const char *a2, ...)
{
  return [a1 validOutputDeviceSet];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_writeCurrentResultsToJson(void *a1, const char *a2, ...)
{
  return [a1 writeCurrentResultsToJson];
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return [a1 xThreshold];
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return [a1 zThreshold];
}