void sub_217A30888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_217A308B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6 = objc_msgSend_assetID(a2, (const char *)a2, a3, a4, a5);
  v11 = objc_msgSend_assetID(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v12, (uint64_t)v11, v13, v14);

  return isEqualToString;
}

void sub_217A30A84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A320BC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = FlexLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_217A2F000, v4, OS_LOG_TYPE_DEFAULT, "Posting kFlexReachabilityChangedNotification for %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v5, v6, v7, v8);
  objc_msgSend_postNotificationName_object_(v9, v10, @"kFlexNetworkReachabilityChangedNotification", (uint64_t)v3, v11);
}

void sub_217A3275C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A32954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_217A32990(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    uint64_t v6 = objc_msgSend_library(WeakRetained, v2, v3, v4, v5);
    objc_msgSend__updateFromCloud(v6, v7, v8, v9, v10);

    id WeakRetained = v11;
  }
}

void sub_217A32BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A32DCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_217A3349C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_isEqualToString_(a2, (const char *)a2, (uint64_t)&stru_26C7FED08, a4, a5);
}

intptr_t sub_217A34578(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_217A347B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_217A347F8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_values(v3, v4, v5, v6, v7);
  int v12 = objc_msgSend_objectForKey_(v8, v9, @"SegmentType", v10, v11);

  if (v12 && (objc_msgSend_isEqualToString_(v12, v13, @"SILENCE", v14, v15) & 1) == 0)
  {
    v20 = objc_msgSend_values(v3, v16, v17, v18, v19);
    v24 = objc_msgSend_objectForKey_(v20, v21, @"PeakValue", v22, v23);

    if (v24)
    {
      objc_msgSend_doubleValue(v24, v25, v26, v27, v28);
      uint64_t v34 = *(void *)(a1[4] + 8);
      if (v33 > *(double *)(v34 + 24)) {
        *(double *)(v34 + 24) = v33;
      }
    }
    else
    {
      ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
      FlexLogForCategory(0);
      v35 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG)) {
        sub_217A34BD0(v3, v35, v36, v37, v38);
      }
    }
    v39 = objc_msgSend_values(v3, v29, v30, v31, v32);
    v43 = objc_msgSend_objectForKey_(v39, v40, @"Loudness", v41, v42);

    if (v43)
    {
      objc_msgSend_doubleValue(v43, v44, v45, v46, v47);
      if (v52 >= -70.0) {
        double v53 = v52;
      }
      else {
        double v53 = -70.0;
      }
      if (v3) {
        objc_msgSend_timeRange(v3, v48, v49, v50, v51);
      }
      else {
        memset(v59, 0, sizeof(v59));
      }
      CMTime time = *(CMTime *)&v59[1];
      double Seconds = CMTimeGetSeconds(&time);
      if (Seconds > 0.0)
      {
        *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + v53 * Seconds;
        *(double *)(*(void *)(a1[7] + 8) + 24) = Seconds + *(double *)(*(void *)(a1[7] + 8) + 24);
      }
    }
    else
    {
      ++*(_DWORD *)(*(void *)(a1[8] + 8) + 24);
      FlexLogForCategory(0);
      v54 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEBUG)) {
        sub_217A34B18(v3, v54, v55, v56, v57);
      }
    }
  }
}

void sub_217A34AF8(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

void sub_217A34B18(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_name(a1, a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v5, v7, @"Missing loudness value for segment item: %@", v8, v9);
  sub_217A34AF8(&dword_217A2F000, v11, v12, "%@", v13, v14, v15, v16, (uint64_t)v6, v17, 2u);
}

void sub_217A34BD0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_name(a1, a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v5, v7, @"Missing peak value for segment item: %@", v8, v9);
  sub_217A34AF8(&dword_217A2F000, v11, v12, "%@", v13, v14, v15, v16, (uint64_t)v6, v17, 2u);
}

uint64_t sub_217A34D44(uint64_t a1)
{
  v2 = [FMSongLibrary alloc];
  qword_267BA93A8 = objc_msgSend_initWithOptions_(v2, v3, *(void *)(a1 + 32), v4, v5);
  return MEMORY[0x270F9A758]();
}

void sub_217A35168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A35494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A356FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_217A358F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__updateFromCloud(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_217A3599C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_217A35B84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217A35BA8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!a3)
    {
      objc_msgSend_setContactedCloud_(WeakRetained, v7, 1, v9, v10);
      objc_msgSend__notifySongsChanged_(*(void **)(a1 + 32), v17, (uint64_t)v5, v18, v19);
      goto LABEL_8;
    }
    int v12 = objc_msgSend_cloudManager(WeakRetained, v7, v8, v9, v10);
    objc_msgSend_retryFetchAllSongs(v12, v13, v14, v15, v16);
  }
  else
  {
    int v12 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_217A2F000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to handle success or error from fetchAllSongsWithCompletion: but self is nil.", v20, 2u);
    }
  }

LABEL_8:
}

uint64_t sub_217A36334(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], a2, @"songName", a4, a5, @"artistName", @"songVersion", @"artVersion", @"compatibilityVersion", @"recordID", @"mood", @"moodAlt", @"pace", @"arousal", @"valence", @"visualTempo", @"genreStrings", @"regionStrings", @"format",
    @"style",
    @"audioEncoderPresetName",
    @"hidden",
    @"recalled",
  qword_267BA93C8 = 0);
  return MEMORY[0x270F9A758]();
}

BOOL sub_217A38764(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
  double v12 = v11;
  objc_msgSend_doubleValue(*(void **)(a1 + 32), v13, v14, v15, v16);
  if (v12 > v21) {
    *a4 = 1;
  }
  objc_msgSend_doubleValue(v6, v17, v18, v19, v20);
  double v23 = v22;
  objc_msgSend_doubleValue(*(void **)(a1 + 40), v24, v25, v26, v27);
  if (v23 >= v32)
  {
    objc_msgSend_doubleValue(v6, v28, v29, v30, v31);
    double v35 = v34;
    objc_msgSend_doubleValue(*(void **)(a1 + 32), v36, v37, v38, v39);
    BOOL v33 = v35 < v40;
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

void sub_217A39AE4(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = NSNumber;
  uint64_t v7 = objc_msgSend_count(a1, a2, a3, a4, a5);
  double v11 = objc_msgSend_numberWithUnsignedInteger_(v6, v8, v7, v9, v10);
  int v12 = 138412290;
  int v13 = v11;
  _os_log_debug_impl(&dword_217A2F000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Found %@ number of loop points in rendition.", (uint8_t *)&v12, 0xCu);
}

void sub_217A39F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_217A39F28(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (a3)
  {
    uint64_t v10 = objc_msgSend_allDurations(*(void **)(a1 + 32), v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(v10, v11, a3 - 1, v12, v13);

    if (v9) {
      objc_msgSend_CMTimeValue(v9, v15, v16, v17, v18);
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    if (v14) {
      objc_msgSend_CMTimeValue(v14, v19, v20, v21, v22);
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = Seconds
                                                                - CMTimeGetSeconds(&v24)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void sub_217A3C4CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v6, @"FMSongAssetsChanged", *(void *)(a1 + 32), 0);
}

void sub_217A3C75C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v6, @"FMSongAssetDownloadProgressChanged", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_217A3D8A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[43] = *MEMORY[0x263EF8340];
  v7[0] = @"Mood_Ethereal";
  v7[1] = @"Mood_Sentimental";
  v7[2] = @"Mood_Chill";
  v7[3] = @"Mood_Gentle";
  v7[4] = @"Mood_Happy";
  v7[5] = @"Mood_Uplifting";
  v7[6] = @"Mood_Party";
  v7[7] = @"Mood_Action";
  v7[8] = @"Mood_Epic";
  v7[9] = @"Mood_Neutral";
  v7[10] = @"SongPace_Slow";
  v7[11] = @"SongPace_Medium";
  v7[12] = @"SongPace_Fast";
  v7[13] = @"MoodAlt_Sentimental";
  v7[14] = @"MoodAlt_Playful";
  v7[15] = @"MoodAlt_Action";
  v7[16] = @"MoodAlt_Event";
  v7[17] = @"MoodAlt_Chill";
  v7[18] = @"MoodAlt_Retro";
  v7[19] = @"MoodAlt_Pop";
  v7[20] = @"Genre_Blues";
  v7[21] = @"Genre_Classical";
  v7[22] = @"Genre_Country";
  v7[23] = @"Genre_Dance";
  v7[24] = @"Genre_Electronic";
  v7[25] = @"Genre_HipHopRap";
  v7[26] = @"Genre_Holiday";
  v7[27] = @"Genre_Indie";
  v7[28] = @"Genre_Jazz";
  v7[29] = @"Genre_KidsFamily";
  v7[30] = @"Genre_Latin";
  v7[31] = @"Genre_Lounge";
  v7[32] = @"Genre_Metal";
  v7[33] = @"Genre_Pop";
  v7[34] = @"Genre_R&B";
  v7[35] = @"Genre_Reggae";
  v7[36] = @"Genre_Rock";
  v7[37] = @"Genre_SingerSongwriter";
  v7[38] = @"Genre_SoulFunk";
  v7[39] = @"Genre_StageScreen";
  v7[40] = @"Genre_World";
  v7[41] = @"Genre_Alternative";
  v7[42] = @"Genre_Downtempo";
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v7, 43, a5);
  uint64_t v6 = (void *)qword_267BA93D0;
  qword_267BA93D0 = v5;
}

void sub_217A3E650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_217A3E67C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_217A3E68C(uint64_t a1)
{
}

void sub_217A3E694(uint64_t a1, void *a2)
{
  double v11 = a2;
  if (objc_msgSend_hasPrefix_(v11, v3, @"Mood_", v4, v5))
  {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v11, (uint64_t)v11, v7, v8);
  }
  else if (objc_msgSend_hasPrefix_(v11, v6, @"SongPace_", v7, v8))
  {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11, (uint64_t)v11, v9, v10);
  }
}

void sub_217A3E818(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_217A3E840(uint64_t a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_uid(a2, (const char *)a2, (uint64_t)a3, a4, a5);
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  double v11 = v7;
  _os_log_error_impl(&dword_217A2F000, a3, OS_LOG_TYPE_ERROR, "ERROR: client provide uid %@ does not match expected UID %@", (uint8_t *)&v8, 0x16u);
}

void sub_217A3E8F4()
{
  sub_217A3E834();
  sub_217A3E818(&dword_217A2F000, v0, v1, "ERROR: Error loading client initiated backend", v2, v3, v4, v5, v6);
}

void sub_217A3E928()
{
  sub_217A3E834();
  sub_217A3E818(&dword_217A2F000, v0, v1, "ERROR: Client provided unexpected assets", v2, v3, v4, v5, v6);
}

void _FMLogMessage(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x400uLL, a3, &a9);
  size_t v11 = strlen(__str);
  if (v11 <= 0x3FE) {
    snprintf(&__str[v11], 1024 - v11, " (file: %s, line: %u)", a1, a2);
  }
  uint64_t v12 = FlexLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_217A3EA3C((uint64_t)__str, v12);
  }
}

void sub_217A3EA3C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217A2F000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
}

id FlexLogForCategory(unint64_t a1)
{
  if (a1 >= 4) {
    sub_217A3EBCC();
  }
  if (qword_26ABF5FF0 != -1) {
    dispatch_once(&qword_26ABF5FF0, &unk_26C7FE7E8);
  }
  int v2 = (void *)qword_26ABF5FD0[a1];
  return v2;
}

uint64_t sub_217A3EB24()
{
  os_log_t v0 = os_log_create("com.apple.FlexMusicKit", "FlexMusicKit");
  uint64_t v1 = (void *)qword_26ABF5FD0[0];
  qword_26ABF5FD0[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.FlexMusicKit", "FlexMusicSequencer");
  uint64_t v3 = (void *)qword_26ABF5FD8;
  qword_26ABF5FD8 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.FlexMusicKit", "FlexMusicCloud");
  uint64_t v5 = (void *)qword_26ABF5FE0;
  qword_26ABF5FE0 = (uint64_t)v4;

  qword_26ABF5FE8 = (uint64_t)os_log_create("com.apple.FlexMusicKit", "FlexMusicDatabase");
  return MEMORY[0x270F9A758]();
}

void sub_217A3EBCC()
{
}

id FlexDynamicCast(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_217A3FBB4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v34;
    uint64_t v15 = (CMTime *)MEMORY[0x263F01090];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        memset(&v32, 0, sizeof(v32));
        if (v17)
        {
          int32_t v18 = *(_DWORD *)(a1 + 32);
          objc_msgSend_doubleValue(v17, v9, v10, v11, v12);
          CMTimeMakeWithSeconds(&lhs, v19, v18);
        }
        else
        {
          CMTime lhs = *v15;
        }
        CMTime v30 = *(CMTime *)(a1 + 36);
        CMTimeAdd(&v32, &lhs, &v30);
        uint64_t v20 = NSNumber;
        CMTime v30 = v32;
        Float64 Seconds = CMTimeGetSeconds(&v30);
        uint64_t v26 = objc_msgSend_numberWithDouble_(v20, v22, v23, v24, v25, Seconds);
        objc_msgSend_addObject_(v5, v27, (uint64_t)v26, v28, v29);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v13);
  }
}

void sub_217A413DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v10 = a3;
  if (v10)
  {
    uint64_t v11 = FlexLogForCategory(3uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_217A2F000, v11, OS_LOG_TYPE_DEFAULT, "Failed to load local song local database %@, error %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_newBackgroundContext(*(void **)(*(void *)(a1 + 32) + 16), v6, v7, v8, v9);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = v12;
  }
}

void sub_217A41748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_217A4177C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_217A4178C(uint64_t a1)
{
}

void sub_217A41794(uint64_t a1)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v2 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v7 = objc_msgSend_uid(*(void **)(a1 + 32), v3, v4, v5, v6);
  v93 = objc_msgSend_initWithUUIDString_(v2, v8, (uint64_t)v7, v9, v10);

  if (v93)
  {
    int v15 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v11, @"LocalSongs", v13, v14);
    uint64_t v19 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v16, @"uuid == %@", v17, v18, v93);
    objc_msgSend_setPredicate_(v15, v20, (uint64_t)v19, v21, v22);

    id v23 = objc_loadWeakRetained(&to);
    id v99 = 0;
    v92 = objc_msgSend_executeFetchRequest_error_(v23, v24, (uint64_t)v15, (uint64_t)&v99, v25);
    id v26 = v99;

    if (objc_msgSend_count(v92, v27, v28, v29, v30) || v26)
    {
      if (v26)
      {
        v66 = FlexLogForCategory(3uLL);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_217A42F3C();
        }

        uint64_t v67 = *(void *)(*(void *)(a1 + 40) + 8);
        id v68 = v26;
        long long v35 = *(NSObject **)(v67 + 40);
        *(void *)(v67 + 40) = v68;
      }
      else
      {
        long long v35 = FlexLogForCategory(3uLL);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_217A42ED4();
        }
      }
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x263EFF240];
      id v32 = objc_loadWeakRetained(&to);
      long long v35 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(v31, v33, @"LocalSongs", (uint64_t)v32, v34);

      objc_msgSend_setUuid_(v35, v36, (uint64_t)v93, v37, v38);
      objc_msgSend_songData(*(void **)(a1 + 32), v39, v40, v41, v42);
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v95, (uint64_t)v107, 16);
      if (v48)
      {
        uint64_t v49 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v96 != v49) {
              objc_enumerationMutation(v43);
            }
            uint64_t v51 = *(void *)(*((void *)&v95 + 1) + 8 * i);
            double v52 = objc_msgSend_objectForKeyedSubscript_(v43, v45, v51, v46, v47);
            objc_msgSend_setValue_forKey_(v35, v53, (uint64_t)v52, v51, v54);
          }
          uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v95, (uint64_t)v107, 16);
        }
        while (v48);
      }
    }
    v65 = v92;
  }
  else
  {
    uint64_t v55 = NSString;
    uint64_t v56 = objc_msgSend_uid(*(void **)(a1 + 32), v11, v12, v13, v14);
    int v15 = objc_msgSend_stringWithFormat_(v55, v57, @"'%@' is an invalid UUID. Record not saved to local database", v58, v59, v56);

    v60 = (void *)MEMORY[0x263F087E8];
    uint64_t v105 = *MEMORY[0x263F07F80];
    v106 = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v61, (uint64_t)&v106, (uint64_t)&v105, 1);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v63 = objc_msgSend_errorWithDomain_code_userInfo_(v60, v62, @"com.apple.FlexMusicKit.DatabaseError", 0, (uint64_t)v26);
    uint64_t v64 = *(void *)(*(void *)(a1 + 40) + 8);
    v65 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v69 = objc_loadWeakRetained(&to);
    int hasChanges = objc_msgSend_hasChanges(v69, v70, v71, v72, v73);

    if (hasChanges)
    {
      id v75 = objc_loadWeakRetained(&to);
      uint64_t v76 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v76 + 40);
      int v80 = objc_msgSend_save_(v75, v77, (uint64_t)&obj, v78, v79);
      objc_storeStrong((id *)(v76 + 40), obj);

      if (!v80)
      {
        v81 = FlexLogForCategory(3uLL);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v86 = objc_msgSend_localizedDescription(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v82, v83, v84, v85);
          v91 = objc_msgSend_localizedRecoverySuggestion(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v87, v88, v89, v90);
          *(_DWORD *)buf = 138412546;
          v102 = v86;
          __int16 v103 = 2112;
          v104 = v91;
          _os_log_impl(&dword_217A2F000, v81, OS_LOG_TYPE_DEFAULT, "Error updating database\n%@\n%@", buf, 0x16u);
        }
        goto LABEL_28;
      }
    }
    else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      goto LABEL_28;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_28:

  objc_destroyWeak(&to);
}

void sub_217A41C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_217A41E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_217A41E38(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v2 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v7 = objc_msgSend_uid(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v84 = objc_msgSend_initWithUUIDString_(v2, v8, (uint64_t)v7, v9, v10);

  if (v84)
  {
    uint64_t v14 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v11, @"LocalSongs", v12, v13);
    uint64_t v18 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v15, @"uuid == %@", v16, v17, v84);
    objc_msgSend_setPredicate_(v14, v19, (uint64_t)v18, v20, v21);
    uint64_t v83 = v14;

    id v22 = objc_loadWeakRetained(&to);
    id v90 = 0;
    v82 = objc_msgSend_executeFetchRequest_error_(v22, v23, (uint64_t)v14, (uint64_t)&v90, v24);
    id v25 = v90;

    if (v25)
    {
      uint64_t v30 = FlexLogForCategory(3uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_217A42F3C();
      }

      uint64_t v31 = *(void *)(*(void *)(a1 + 40) + 8);
      id v32 = v25;
      long long v33 = *(NSObject **)(v31 + 40);
      *(void *)(v31 + 40) = v32;
    }
    else if (objc_msgSend_count(v82, v26, v27, v28, v29))
    {
      long long v33 = objc_msgSend_firstObject(v82, v34, v35, v36, v37);
      uint64_t v42 = objc_msgSend_songData(*(void **)(a1 + 32), v38, v39, v40, v41);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      uint64_t v47 = objc_msgSend_allKeys(v42, v43, v44, v45, v46);
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v86, (uint64_t)v96, 16);
      if (v52)
      {
        uint64_t v53 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v87 != v53) {
              objc_enumerationMutation(v47);
            }
            uint64_t v55 = *(void *)(*((void *)&v86 + 1) + 8 * i);
            uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v42, v49, v55, v50, v51);
            objc_msgSend_setValue_forKey_(v33, v57, (uint64_t)v56, v55, v58);
          }
          uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v49, (uint64_t)&v86, (uint64_t)v96, 16);
        }
        while (v52);
      }
    }
    else
    {
      long long v33 = FlexLogForCategory(3uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_217A42FA4();
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v59 = objc_loadWeakRetained(&to);
    int hasChanges = objc_msgSend_hasChanges(v59, v60, v61, v62, v63);

    if (hasChanges)
    {
      id v65 = objc_loadWeakRetained(&to);
      uint64_t v66 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v66 + 40);
      int v70 = objc_msgSend_save_(v65, v67, (uint64_t)&obj, v68, v69);
      objc_storeStrong((id *)(v66 + 40), obj);

      if (!v70)
      {
        uint64_t v71 = FlexLogForCategory(3uLL);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v76 = objc_msgSend_localizedDescription(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v72, v73, v74, v75);
          v81 = objc_msgSend_localizedRecoverySuggestion(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v77, v78, v79, v80);
          *(_DWORD *)buf = 138412546;
          v93 = v76;
          __int16 v94 = 2112;
          long long v95 = v81;
          _os_log_impl(&dword_217A2F000, v71, OS_LOG_TYPE_DEFAULT, "Error updating database\n%@\n%@", buf, 0x16u);
        }
        goto LABEL_26;
      }
    }
    else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      goto LABEL_26;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_26:

  objc_destroyWeak(&to);
}

void sub_217A42224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_217A42410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_217A42444(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  objc_copyWeak(&to, (id *)(a1 + 64));
  id v2 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v9 = objc_msgSend_initWithUUIDString_(v2, v3, *(void *)(a1 + 32), v4, v5);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v6, @"LocalSongs", v7, v8);
    uint64_t v14 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v11, @"uuid == %@", v12, v13, v9);
    objc_msgSend_setPredicate_(v10, v15, (uint64_t)v14, v16, v17);

    id v18 = objc_loadWeakRetained(&to);
    id v70 = 0;
    uint64_t v21 = objc_msgSend_executeFetchRequest_error_(v18, v19, (uint64_t)v10, (uint64_t)&v70, v20);
    id v22 = v70;

    if (v22)
    {
      uint64_t v27 = FlexLogForCategory(3uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_217A42F3C();
      }

      uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
      id v29 = v22;
      uint64_t v30 = *(NSObject **)(v28 + 40);
      *(void *)(v28 + 40) = v29;
    }
    else if (objc_msgSend_count(v21, v23, v24, v25, v26))
    {
      uint64_t v30 = objc_msgSend_firstObject(v21, v31, v32, v33, v34);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v35 = *(id *)(a1 + 40);
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v66, (uint64_t)v76, 16);
      if (v39)
      {
        uint64_t v40 = *(void *)v67;
        do
        {
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v67 != v40) {
              objc_enumerationMutation(v35);
            }
            objc_msgSend_setValue_forKey_(v30, v37, 0, *(void *)(*((void *)&v66 + 1) + 8 * v41++), v38);
          }
          while (v39 != v41);
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v66, (uint64_t)v76, 16);
        }
        while (v39);
      }
    }
    else
    {
      uint64_t v30 = FlexLogForCategory(3uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_217A42FA4();
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v42 = objc_loadWeakRetained(&to);
    int hasChanges = objc_msgSend_hasChanges(v42, v43, v44, v45, v46);

    if (hasChanges)
    {
      id v48 = objc_loadWeakRetained(&to);
      uint64_t v49 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v49 + 40);
      int v53 = objc_msgSend_save_(v48, v50, (uint64_t)&obj, v51, v52);
      objc_storeStrong((id *)(v49 + 40), obj);

      if (!v53)
      {
        uint64_t v54 = FlexLogForCategory(3uLL);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v59 = objc_msgSend_localizedDescription(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v55, v56, v57, v58);
          uint64_t v64 = objc_msgSend_localizedRecoverySuggestion(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v60, v61, v62, v63);
          *(_DWORD *)buf = 138412546;
          uint64_t v73 = v59;
          __int16 v74 = 2112;
          uint64_t v75 = v64;
          _os_log_impl(&dword_217A2F000, v54, OS_LOG_TYPE_DEFAULT, "Error updating database\n%@\n%@", buf, 0x16u);
        }
        goto LABEL_26;
      }
    }
    else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      goto LABEL_26;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_26:

  objc_destroyWeak(&to);
}

void sub_217A427CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_217A4293C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A42954(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v46 = 0;
  uint64_t v8 = objc_msgSend_executeFetchRequest_error_(v7, a2, v6, (uint64_t)&v46, a5);
  id v9 = v46;
  if (objc_msgSend_count(v8, v10, v11, v12, v13))
  {
    id v18 = objc_msgSend_firstObject(v8, v14, v15, v16, v17);
    uint64_t v23 = objc_msgSend_date(v18, v19, v20, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
  else if (v8)
  {
    if (!objc_msgSend_count(v8, v14, v15, v16, v17))
    {
      uint64_t v30 = objc_msgSend_distantPast(MEMORY[0x263EFF910], v26, v27, v28, v29);
      uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;

      objc_msgSend__insertFirstCloudCheckDate_andSave_(*(void **)(a1 + 32), v33, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 1, v34);
    }
  }
  else
  {
    FlexLogForCategory(0);
    id v35 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR)) {
      sub_217A4300C(v9, v35, v36, v37, v38);
    }

    uint64_t v43 = objc_msgSend_distantPast(MEMORY[0x263EFF910], v39, v40, v41, v42);
    uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v45 = *(void **)(v44 + 40);
    *(void *)(v44 + 40) = v43;
  }
}

void sub_217A42B70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v40 = 0;
  uint64_t v8 = objc_msgSend_executeFetchRequest_error_(v7, a2, v6, (uint64_t)&v40, a5);
  id v9 = v40;
  if (objc_msgSend_count(v8, v10, v11, v12, v13))
  {
    id v18 = objc_msgSend_firstObject(v8, v14, v15, v16, v17);
    objc_msgSend_setDate_(v18, v19, *(void *)(a1 + 48), v20, v21);
LABEL_3:

    goto LABEL_6;
  }
  if (!v8)
  {
    id v18 = FlexLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_217A4300C(v9, (const char *)v18, v36, v37, v38);
    }
    goto LABEL_3;
  }
  objc_msgSend__insertFirstCloudCheckDate_andSave_(*(void **)(a1 + 32), v14, *(void *)(a1 + 48), 0, v17);
LABEL_6:
  if (objc_msgSend_hasChanges(*(void **)(*(void *)(a1 + 32) + 24), v22, v23, v24, v25))
  {
    uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 24);
    id v39 = 0;
    char v30 = objc_msgSend_save_(v29, v26, (uint64_t)&v39, v27, v28);
    id v31 = v39;
    if ((v30 & 1) == 0)
    {
      FlexLogForCategory(0);
      uint64_t v32 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
        sub_217A43090(v31, v32, v33, v34, v35);
      }
    }
  }
}

void sub_217A42DD0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_217A42E14(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_217A42E34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_217A42E50(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  sub_217A42E08();
  sub_217A42DD0(&dword_217A2F000, v6, v7, "Error fetching song records:\n%@", v8, v9, v10, v11, v12);
}

void sub_217A42ED4()
{
  sub_217A42E08();
  sub_217A42E34(&dword_217A2F000, v0, v1, "Song with UID %@ already present in database, new record not saved", v2, v3, v4, v5, v6);
}

void sub_217A42F3C()
{
  sub_217A42DF0();
  sub_217A42E14(&dword_217A2F000, v0, v1, "Error fetching record for UID %@\n%@");
}

void sub_217A42FA4()
{
  sub_217A42E08();
  sub_217A42E34(&dword_217A2F000, v0, v1, "No song record found for UID %@. No database update performed.", v2, v3, v4, v5, v6);
}

void sub_217A4300C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  sub_217A42E08();
  sub_217A42DD0(&dword_217A2F000, v6, v7, "Failed to execute date fetch request\n%@", v8, v9, v10, v11, v12);
}

void sub_217A43090(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  sub_217A42E08();
  sub_217A42DD0(&dword_217A2F000, v6, v7, "Error saving last cloud check date to database.\n%@", v8, v9, v10, v11, v12);
}

BOOL sub_217A43610(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_refreshState(a1, a2, a3, a4, a5);
  return (unint64_t)objc_msgSend_state(a1, v6, v7, v8, v9) > 1;
}

BOOL sub_217A43644(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_attributes(a1, v5, v6, v7, v8);
  uint64_t v10 = objc_opt_class();
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"uuid", v12, v13);
  uint64_t v15 = FlexDynamicCast(v10, v14);

  uint64_t v16 = objc_opt_class();
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v9, v17, @"FMAssetType", v18, v19);
  uint64_t v21 = FlexDynamicCast(v16, v20);

  if (objc_msgSend_isEqualToString_(v21, v22, @"SongBundle", v23, v24))
  {
    uint64_t v28 = FMSongBundleAssetID;
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v21, v25, @"Artwork", v26, v27))
    {
LABEL_10:
      BOOL v77 = 0;
      goto LABEL_15;
    }
    uint64_t v28 = FMSongArtworkAssetID;
  }
  uint64_t v29 = *v28;
  if (!v29) {
    goto LABEL_10;
  }
  char v30 = v29;
  uint64_t v31 = objc_opt_class();
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v9, v32, @"_ContentVersion", v33, v34);
  uint64_t v36 = FlexDynamicCast(v31, v35);
  uint64_t v41 = objc_msgSend_integerValue(v36, v37, v38, v39, v40);

  uint64_t v42 = objc_opt_class();
  id v46 = objc_msgSend_objectForKeyedSubscript_(v9, v43, @"_CompatibilityVersion", v44, v45);
  uint64_t v47 = FlexDynamicCast(v42, v46);
  uint64_t v52 = objc_msgSend_integerValue(v47, v48, v49, v50, v51);

  uint64_t v57 = objc_msgSend_songUID(v4, v53, v54, v55, v56);
  if (objc_msgSend_isEqualToString_(v57, v58, (uint64_t)v15, v59, v60))
  {
    id v65 = objc_msgSend_assetID(v4, v61, v62, v63, v64);
    BOOL v77 = objc_msgSend_isEqualToString_(v65, v66, (uint64_t)v30, v67, v68)
       && objc_msgSend_contentVersion(v4, v69, v70, v71, v72) == v41
       && objc_msgSend_compatibilityVersion(v4, v73, v74, v75, v76) == v52;
  }
  else
  {
    BOOL v77 = 0;
  }

LABEL_15:
  return v77;
}

void sub_217A43F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217A43F84(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained[28] == a2 || WeakRetained[29] == a2)
  {
    uint64_t v7 = WeakRetained;
    objc_msgSend_fetchAllSongsWithCompletion_(WeakRetained, v4, (uint64_t)&unk_26C7FE808, v5, v6);
    id WeakRetained = v7;
  }
}

void sub_217A448CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_217A448E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v9 = objc_msgSend_attributes(v3, v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"_CompatibilityVersion", v11, v12);
    uint64_t v18 = objc_msgSend_integerValue(v13, v14, v15, v16, v17);

    if (objc_msgSend_isEqualToString_(WeakRetained[5], v19, @"Ph", v20, v21)) {
      BOOL v25 = (unint64_t)(v18 - 1) >= 2;
    }
    else {
      BOOL v25 = 1;
    }
    if (v25)
    {
      uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v9, v22, @"uuid", v23, v24);
      char v30 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v27, (uint64_t)v26, v28, v29);
      uint64_t v35 = v30;
      if (v30)
      {
        uint64_t v36 = objc_msgSend_attributes(v30, v31, v32, v33, v34);
        uint64_t v37 = (void *)MEMORY[0x263EFFA08];
        uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v36, v38, @"clientIDs", v39, v40);
        uint64_t v45 = objc_msgSend_setWithArray_(v37, v42, (uint64_t)v41, v43, v44);

        uint64_t v49 = objc_msgSend_containsObject_(v45, v46, (uint64_t)WeakRetained[5], v47, v48);
      }
      else
      {
        uint64_t v49 = 0;
      }
    }
    else
    {
      uint64_t v49 = 1;
    }
  }
  else
  {
    uint64_t v49 = 0;
  }

  return v49;
}

uint64_t sub_217A44AB8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  qword_267BA93E0 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], a2, @"%K <= %d", a4, a5, @"_CompatibilityVersion", 3);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_217A44F7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_stringByDeletingPathExtension(v3, v4, v5, v6, v7);
  if (objc_msgSend_containsString_(v8, v9, *(void *)(a1 + 32), v10, v11))
  {
    uint64_t v16 = objc_msgSend_pathExtension(v3, v12, v13, v14, v15);
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v16, v17, @"smsbundle", v18, v19);
  }
  else
  {
    uint64_t isEqualToString = 0;
  }

  return isEqualToString;
}

uint64_t sub_217A452CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_stringByDeletingPathExtension(v3, v4, v5, v6, v7);
  if (objc_msgSend_containsString_(v8, v9, *(void *)(a1 + 32), v10, v11))
  {
    uint64_t v16 = objc_msgSend_pathExtension(v3, v12, v13, v14, v15);
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v16, v17, @"jpg", v18, v19);
  }
  else
  {
    uint64_t isEqualToString = 0;
  }

  return isEqualToString;
}

void sub_217A457C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217A457EC(void **a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF980];
    uint64_t v8 = objc_msgSend_allObjects(a1[4], v2, v3, v4, v5);
    uint64_t v12 = objc_msgSend_arrayWithArray_(v7, v9, (uint64_t)v8, v10, v11);

    uint64_t v13 = (void *)MEMORY[0x263F08A98];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_217A45A00;
    v35[3] = &unk_2642B7398;
    id v36 = a1[5];
    id v37 = a1[6];
    uint64_t v17 = objc_msgSend_predicateWithBlock_(v13, v14, (uint64_t)v35, v15, v16);
    objc_msgSend_filterUsingPredicate_(v12, v18, (uint64_t)v17, v19, v20);

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v21 = v12;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v31, (uint64_t)v39, 16);
    if (v23)
    {
      uint64_t v28 = v23;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend_purgeSync(*(void **)(*((void *)&v31 + 1) + 8 * i), v24, v25, v26, v27, (void)v31);
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v31, (uint64_t)v39, 16);
      }
      while (v28);
    }
  }
  else
  {
    uint64_t v21 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v21, OS_LOG_TYPE_DEFAULT, "StrongSelf is nil in _newestContentSetFromAssets. Returning...", buf, 2u);
    }
  }
}

uint64_t sub_217A45A00(uint64_t a1, void *a2)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v8 = objc_msgSend_attributes(v3, v4, v5, v6, v7);
  uint64_t v9 = @"uuid";
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v10, @"uuid", v11, v12);
  if (objc_msgSend_containsObject_(*(void **)(a1 + 32), v14, (uint64_t)v3, v15, v16))
  {
LABEL_15:
    if ((objc_msgSend_containsObject_(*(void **)(a1 + 40), v17, (uint64_t)v13, v18, v19) & 1) == 0)
    {
      uint64_t isPresent = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v94 = a1;
    long long v95 = v8;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v20 = *(id *)(a1 + 32);
    uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v103, (uint64_t)v107, 16);
    if (v102)
    {
      uint64_t v26 = *(void *)v104;
      long long v96 = v20;
      uint64_t v100 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v102; ++i)
        {
          if (*(void *)v104 != v26) {
            objc_enumerationMutation(v20);
          }
          uint64_t v28 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          uint64_t v29 = objc_msgSend_attributes(v28, v22, v23, v24, v25);
          long long v33 = objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v9, v31, v32);
          int isEqualToString = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v13, v35, v36);

          if (isEqualToString)
          {
            v101 = objc_msgSend_attributes(v28, v22, v23, v24, v25);
            uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v101, v38, @"_ContentVersion", v39, v40);
            uint64_t v46 = objc_msgSend_integerValue(v41, v42, v43, v44, v45);
            uint64_t v51 = objc_msgSend_attributes(v3, v47, v48, v49, v50);
            uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v51, v52, @"_ContentVersion", v53, v54);
            if (v46 == objc_msgSend_integerValue(v55, v56, v57, v58, v59))
            {
              long long v98 = objc_msgSend_attributes(v28, v60, v61, v62, v63);
              uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v98, v64, @"_CompatibilityVersion", v65, v66);
              uint64_t v99 = objc_msgSend_integerValue(v67, v68, v69, v70, v71);
              objc_msgSend_attributes(v3, v72, v73, v74, v75);
              uint64_t v76 = v13;
              uint64_t v78 = v77 = v3;
              objc_msgSend_objectForKeyedSubscript_(v78, v79, @"_CompatibilityVersion", v80, v81);
              uint64_t v83 = v82 = v9;
              uint64_t v97 = objc_msgSend_integerValue(v83, v84, v85, v86, v87);

              uint64_t v9 = v82;
              id v3 = v77;
              uint64_t v13 = v76;
              id v20 = v96;

              uint64_t v26 = v100;
              if (v99 == v97)
              {

                a1 = v94;
                uint64_t v8 = v95;
                goto LABEL_15;
              }
            }
            else
            {

              uint64_t v26 = v100;
            }
          }
        }
        uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v103, (uint64_t)v107, 16);
      }
      while (v102);
    }

    uint64_t v8 = v95;
  }
  uint64_t isPresent = objc_msgSend_isPresent(v3, v88, v89, v90, v91);
LABEL_18:

  return isPresent;
}

void sub_217A45E14(uint64_t a1, uint64_t a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v4 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend__mobileAssetDownloadResultStringValue_(*(void **)(a1 + 32), v5, a2, v6, v7);
    *(_DWORD *)buf = 138412290;
    v93 = v8;
    _os_log_impl(&dword_217A2F000, v4, OS_LOG_TYPE_DEFAULT, "Completed catalog download with MADownloadResult: %@", buf, 0xCu);
  }
  uint64_t v15 = objc_msgSend__responseForDownloadResult_(*(void **)(a1 + 32), v9, a2, v10, v11);
  switch(v15)
  {
    case 0:
    case 2:
      uint64_t v16 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(*(void **)(a1 + 32), v12, @"SongBundle", 0, v14);
      uint64_t v21 = objc_msgSend_set(MEMORY[0x263EFF9C0], v17, v18, v19, v20);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v22 = v16;
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v85, (uint64_t)v91, 16);
      if (v24)
      {
        uint64_t v29 = v24;
        uint64_t v30 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v86 != v30) {
              objc_enumerationMutation(v22);
            }
            uint64_t v32 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            long long v33 = objc_msgSend_attributes(v32, v25, v26, v27, v28);
            id v37 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"uuid", v35, v36);

            if (v37)
            {
              uint64_t v42 = objc_msgSend_attributes(v32, v38, v39, v40, v41);
              uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v42, v43, @"uuid", v44, v45);
              objc_msgSend_addObject_(v21, v47, (uint64_t)v46, v48, v49);
            }
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v85, (uint64_t)v91, 16);
        }
        while (v29);
      }

      uint64_t v53 = objc_msgSend__metadataMappingForUUIDSet_(*(void **)(a1 + 32), v50, (uint64_t)v21, v51, v52);
      uint64_t v56 = objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(*(void **)(a1 + 32), v54, (uint64_t)v22, (uint64_t)v53, v55);
      id v59 = (id)objc_msgSend__processResults_metadataMapping_(*(void **)(a1 + 32), v57, (uint64_t)v56, (uint64_t)v53, v58);
      uint64_t v60 = *(void *)(a1 + 40);
      uint64_t v65 = objc_msgSend_cloudManagedSongs(*(void **)(a1 + 32), v61, v62, v63, v64);
      (*(void (**)(uint64_t, void *, void))(v60 + 16))(v60, v65, 0);

      uint64_t v68 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(*(void **)(a1 + 32), v66, @"Artwork", 0, v67);
      uint64_t v71 = objc_msgSend__newestContentSetFromAssets_metadataMapping_(*(void **)(a1 + 32), v69, (uint64_t)v68, (uint64_t)v53, v70);
      uint64_t v74 = objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(*(void **)(a1 + 32), v72, (uint64_t)v71, (uint64_t)v53, v73);

      id v77 = (id)objc_msgSend__processResults_metadataMapping_(*(void **)(a1 + 32), v75, (uint64_t)v74, (uint64_t)v53, v76);
      goto LABEL_17;
    case 1:
    case 3:
      objc_msgSend__mobileAssetDownloadResultStringValue_(*(void **)(a1 + 32), v12, a2, v13, v14);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v78, @"An error occurred while downloading the Mobile Assets catalog: %@", v79, v80, v22);
      uint64_t v81 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = v21;
        _os_log_impl(&dword_217A2F000, v81, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v82 = *MEMORY[0x263F08338];
      v89[0] = *MEMORY[0x263F08320];
      v89[1] = v82;
      v90[0] = v21;
      v90[1] = v22;
      uint64_t v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v83, (uint64_t)v90, (uint64_t)v89, 2);
      uint64_t v74 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v84, @"com.apple.FlexMusicKit", v15, (uint64_t)v53);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:

      break;
    default:
      return;
  }
}

void sub_217A47DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_217A47DE0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_attributes(a2, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"_ContentVersion", v11, v12);
  uint64_t v18 = objc_msgSend_attributes(v4, v14, v15, v16, v17);

  id v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"_ContentVersion", v20, v21);
  uint64_t v26 = objc_msgSend_compare_(v13, v23, (uint64_t)v22, v24, v25);

  return v26;
}

void sub_217A4864C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__runNextAsyncAssetDownloadAndPurge(WeakRetained, v2, v3, v4, v5);
  }
  else
  {
    uint64_t v7 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_217A2F000, v7, OS_LOG_TYPE_DEFAULT, "FlexMobileAssetManagerV2 is nil from _dispatchNextAsyncAssetDownloadAndPurge:", v8, 2u);
    }
  }
}

void sub_217A48894(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A48A98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A48CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A4904C(uint64_t a1)
{
  v72[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v7 = objc_msgSend_assetID(*(void **)(a1 + 32), v2, v3, v4, v5);
    char isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"FMSongBundleAssetID", v9, v10);

    if (isEqualToString)
    {
      uint64_t v16 = FlexMobileAssetPropertySongBundle;
    }
    else
    {
      uint64_t v18 = objc_msgSend_assetID(*(void **)(a1 + 32), v12, v13, v14, v15);
      int v22 = objc_msgSend_isEqualToString_(v18, v19, @"FMSongArtworkAssetID", v20, v21);

      if (!v22)
      {
        uint64_t v17 = 0;
        goto LABEL_15;
      }
      uint64_t v16 = FlexMobileAssetPropertyArtwork;
    }
    uint64_t v17 = *v16;
    if (v17)
    {
      uint64_t v27 = *(void **)(a1 + 40);
      uint64_t v28 = objc_msgSend_uid(*(void **)(a1 + 48), v23, v24, v25, v26);
      v72[0] = v28;
      uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v72, 1, v30);
      long long v34 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(v27, v32, (uint64_t)v17, (uint64_t)v31, v33);

      id v37 = objc_msgSend_assetWithNewestContentVersionInAssets_preferInstalled_(FlexMobileAssetManagerV2, v35, (uint64_t)v34, 0, v36);

      if (v37)
      {
        if (objc_msgSend_isPresent(v37, v38, v39, v40, v41))
        {
          uint64_t v45 = FlexLogForCategory(2uLL);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = *(void *)(a1 + 56);
            int v70 = 138412290;
            uint64_t v71 = v46;
            _os_log_impl(&dword_217A2F000, v45, OS_LOG_TYPE_DEFAULT, "Not downloading %@ because mobile asset is alredy installed.", (uint8_t *)&v70, 0xCu);
          }
        }
        else if ((objc_msgSend__isDownloadingAsset_(*(void **)(a1 + 40), v42, *(void *)(a1 + 32), v43, v44) & 1) == 0)
        {
          id v49 = WeakRetained[7];
          objc_sync_enter(v49);
          objc_msgSend_addObject_(WeakRetained[9], v50, (uint64_t)v37, v51, v52);
          objc_msgSend_setObject_forKey_(WeakRetained[11], v53, *(void *)(a1 + 64), (uint64_t)v37, v54);
          if (objc_msgSend_containsObject_(WeakRetained[12], v55, (uint64_t)v37, v56, v57)) {
            objc_msgSend_removeObject_(WeakRetained[12], v58, (uint64_t)v37, v59, v60);
          }
          if (objc_msgSend_containsObject_(WeakRetained[13], v58, (uint64_t)v37, v59, v60)) {
            objc_msgSend_removeObject_(WeakRetained[13], v61, (uint64_t)v37, v62, v63);
          }
          objc_sync_exit(v49);

          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 48), v64, *(void *)(a1 + 32), 0, v65, 0.01);
          objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge(WeakRetained, v66, v67, v68, v69);
        }
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_15:
    uint64_t v47 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = *(void *)(a1 + 56);
      int v70 = 138412290;
      uint64_t v71 = v48;
      _os_log_impl(&dword_217A2F000, v47, OS_LOG_TYPE_DEFAULT, "Not downloading %@ because no mobile asset exists.", (uint8_t *)&v70, 0xCu);
    }

    id v37 = 0;
    goto LABEL_18;
  }
  uint64_t v17 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v70) = 0;
    _os_log_impl(&dword_217A2F000, v17, OS_LOG_TYPE_DEFAULT, "FlexMobileAssetManagerV2 is nil from _dispatchNextAsyncAssetDownloadAndPurge:", (uint8_t *)&v70, 2u);
  }
LABEL_19:
}

void sub_217A49394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A498F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217A49934(uint64_t a1, void *a2)
{
  id v19 = a2;
  if (objc_msgSend_totalExpected(v19, v3, v4, v5, v6) < 1)
  {
    objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 32), v7, *(void *)(a1 + 40), 0, v10, 0.01);
  }
  else
  {
    double v11 = (double)objc_msgSend_totalWritten(v19, v7, v8, v9, v10);
    double v16 = v11 / (double)objc_msgSend_totalExpected(v19, v12, v13, v14, v15);
    objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 32), v17, *(void *)(a1 + 40), 0, v18, v16);
  }
}

void sub_217A499C0(uint64_t a1, uint64_t a2)
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v5 = FlexLogForCategory(2uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v12 = objc_msgSend__mobileAssetDownloadResultStringValue_(*(void **)(a1 + 48), v7, a2, v8, v9);
      *(_DWORD *)buf = 138412802;
      uint64_t v111 = v11;
      __int16 v112 = 2112;
      uint64_t v113 = v10;
      __int16 v114 = 2112;
      uint64_t v115 = (uint64_t)v12;
      _os_log_impl(&dword_217A2F000, v5, OS_LOG_TYPE_DEFAULT, "Ending download task for UID: %@ assetID: %@. MADownloadResult: %@", buf, 0x20u);
    }
    uint64_t v16 = objc_msgSend__responseForDownloadResult_(WeakRetained, v13, a2, v14, v15);
    switch(v16)
    {
      case 0:
      case 2:
        id v17 = WeakRetained[7];
        objc_sync_enter(v17);
        int v21 = objc_msgSend_containsObject_(WeakRetained[10], v18, *(void *)(a1 + 56), v19, v20);
        objc_sync_exit(v17);

        if (v21)
        {
          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v22, *(void *)(a1 + 72), 0, v23, 1.0);
          objc_msgSend_refreshState(*(void **)(a1 + 56), v24, v25, v26, v27);
          id v28 = WeakRetained[7];
          objc_sync_enter(v28);
          objc_msgSend_removeObject_(WeakRetained[10], v29, *(void *)(a1 + 56), v30, v31);
          objc_msgSend_removeObjectForKey_(WeakRetained[11], v32, *(void *)(a1 + 56), v33, v34);
          objc_sync_exit(v28);

          uint64_t v38 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v35, *(void *)(a1 + 32), v36, v37);
          uint64_t v42 = objc_msgSend__metadataMappingForUUIDSet_(WeakRetained, v39, (uint64_t)v38, v40, v41);

          uint64_t v46 = objc_msgSend_objectForKey_(v42, v43, *(void *)(a1 + 32), v44, v45);
          objc_msgSend__updateExistingSong_usingAsset_metadataAsset_(WeakRetained, v47, *(void *)(a1 + 64), *(void *)(a1 + 56), (uint64_t)v46);
        }
        else
        {
          uint64_t v66 = FlexLogForCategory(2uLL);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v67 = *(void *)(a1 + 32);
            uint64_t v68 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            uint64_t v111 = v67;
            __int16 v112 = 2112;
            uint64_t v113 = v68;
            _os_log_impl(&dword_217A2F000, v66, OS_LOG_TYPE_DEFAULT, "Cancel request after downloading, purging %@ %@", buf, 0x16u);
          }

          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v69, *(void *)(a1 + 72), 0, v70, -1.0);
          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v71, *(void *)(a1 + 72), 0, v72, 0.0);
          id v73 = WeakRetained[7];
          objc_sync_enter(v73);
          objc_msgSend_addObject_(WeakRetained[12], v74, *(void *)(a1 + 56), v75, v76);
          objc_msgSend_removeObject_(WeakRetained[10], v77, *(void *)(a1 + 56), v78, v79);
          objc_msgSend_removeObjectForKey_(WeakRetained[11], v80, *(void *)(a1 + 56), v81, v82);
          objc_sync_exit(v73);
        }
        char v83 = 1;
        goto LABEL_26;
      case 1:
      case 3:
        id v48 = WeakRetained[7];
        objc_sync_enter(v48);
        if (objc_msgSend_containsObject_(WeakRetained[10], v49, *(void *)(a1 + 56), v50, v51))
        {
          uint64_t v52 = FlexLogForCategory(2uLL);
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          uint64_t v53 = *(void *)(a1 + 32);
          uint64_t v54 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          uint64_t v111 = v53;
          __int16 v112 = 2112;
          uint64_t v113 = v54;
          __int16 v114 = 2048;
          uint64_t v115 = v16;
          uint64_t v55 = "Asset download failed when attempting to download asset %@ %@ - %lu";
          uint64_t v56 = v52;
          uint32_t v57 = 32;
        }
        else
        {
          uint64_t v52 = FlexLogForCategory(2uLL);
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          uint64_t v58 = *(void *)(a1 + 32);
          uint64_t v59 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v111 = v58;
          __int16 v112 = 2112;
          uint64_t v113 = v59;
          uint64_t v55 = "Asset download canceled %@ %@";
          uint64_t v56 = v52;
          uint32_t v57 = 22;
        }
        _os_log_impl(&dword_217A2F000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
LABEL_16:

        objc_msgSend_removeObjectForKey_(WeakRetained[11], v60, *(void *)(a1 + 56), v61, v62);
        objc_sync_exit(v48);

        if (a2 == 10)
        {
          if (objc_msgSend_containsObject_(WeakRetained[13], v63, *(void *)(a1 + 56), v64, v65)) {
            goto LABEL_18;
          }
        }
        else if (a2 == 48)
        {
LABEL_18:
          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v63, *(void *)(a1 + 72), 0, v65, 0.0);
          goto LABEL_25;
        }
        uint64_t v84 = *MEMORY[0x263F08338];
        v108[0] = *MEMORY[0x263F08320];
        v108[1] = v84;
        v109[0] = @"Download operation was unsuccessful.";
        long long v85 = objc_msgSend_stringWithFormat_(NSString, v63, @"MobileAsset error %li", v64, v65, a2);
        v109[1] = v85;
        long long v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v86, (uint64_t)v109, (uint64_t)v108, 2);

        uint64_t v89 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v88, @"com.apple.FlexMusicKit", a2, (uint64_t)v87);
        objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v90, *(void *)(a1 + 72), (uint64_t)v89, v91, -1.0);
        objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v92, *(void *)(a1 + 72), 0, v93, 0.0);

LABEL_25:
        char v83 = 0;
LABEL_26:
        uint64_t v94 = FlexLogForCategory(2uLL);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v95 = *(void *)(a1 + 32);
          uint64_t v96 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v111 = v95;
          __int16 v112 = 2112;
          uint64_t v113 = v96;
          _os_log_impl(&dword_217A2F000, v94, OS_LOG_TYPE_DEFAULT, "Completed processing of %@ %@", buf, 0x16u);
        }

        if ((v83 & 1) == 0)
        {
          id v101 = WeakRetained[7];
          objc_sync_enter(v101);
          objc_msgSend_removeObject_(WeakRetained[10], v102, *(void *)(a1 + 56), v103, v104);
          objc_msgSend_removeObjectForKey_(WeakRetained[11], v105, *(void *)(a1 + 56), v106, v107);
          objc_sync_exit(v101);
        }
        objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge(WeakRetained, v97, v98, v99, v100);
        break;
      default:
        goto LABEL_25;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v5, OS_LOG_TYPE_DEFAULT, "attempted to download but no cloud manager", buf, 2u);
    }
  }
}

void sub_217A4A018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A4A4D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A4A514(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v4 = FlexLogForCategory(2uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = objc_msgSend__mobileAssetCancelDownloadResultStringValue_(*(void **)(a1 + 48), v6, a2, v7, v8);
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v9;
      __int16 v33 = 2112;
      uint64_t v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v11;
      _os_log_impl(&dword_217A2F000, v4, OS_LOG_TYPE_DEFAULT, "Cancel download failed for mobile asset with songUID: %@ assetID: %@ MACancelDownloadResult: %@", buf, 0x20u);
    }
    if (a2 != 3)
    {
      uint64_t v15 = *MEMORY[0x263F08338];
      v29[0] = *MEMORY[0x263F08320];
      v29[1] = v15;
      v30[0] = @"Cancel operation was unsuccessful.";
      uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v12, @"MobileAsset error %li", v13, v14, a2);
      v30[1] = v16;
      uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v30, (uint64_t)v29, 2);

      uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v19, @"com.apple.FlexMusicKit", a2, (uint64_t)v18);
      objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v21, *(void *)(a1 + 64), (uint64_t)v20, v22, -1.0);
      objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v23, *(void *)(a1 + 64), 0, v24, 0.0);

      return;
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      uint64_t v34 = v26;
      _os_log_impl(&dword_217A2F000, v4, OS_LOG_TYPE_DEFAULT, "Cancel download success for mobile asset with songUID: %@ assetID: %@ ", buf, 0x16u);
    }
  }
  objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v12, *(void *)(a1 + 64), 0, v14, -1.0);
  objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v27, *(void *)(a1 + 64), 0, v28, 0.0);
}

void sub_217A4A924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_217A4AAE0(uint64_t a1)
{
  v247[2] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[7];
    objc_sync_enter(v4);
    if (objc_msgSend_containsObject_(*(void **)(v3 + 104), v5, *(void *)(a1 + 32), v6, v7))
    {
      objc_sync_exit(v4);

      if (!objc_msgSend_isPresent(*(void **)(a1 + 32), v12, v13, v14, v15))
      {
LABEL_54:
        id v211 = *(id *)(v3 + 56);
        objc_sync_enter(v211);
        objc_msgSend_removeObject_(*(void **)(v3 + 104), v212, *(void *)(a1 + 32), v213, v214);
        objc_sync_exit(v211);

        v215 = *(NSObject **)(v3 + 144);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_217A4B374;
        block[3] = &unk_2642B6D78;
        block[4] = v3;
        dispatch_async(v215, block);
        goto LABEL_55;
      }
      uint64_t v19 = (void **)(a1 + 48);
      v225 = objc_msgSend_existingAssetWithID_(*(void **)(a1 + 40), v16, *(void *)(a1 + 48), v17, v18);
      if (objc_msgSend_isEqualToString_(*(void **)(a1 + 48), v20, @"FMSongBundleAssetID", v21, v22))objc_msgSend_existingAssetWithID_(*(void **)(a1 + 40), v23, @"FMSongArtworkAssetID", v24, v25); {
      else
      }
      v224 = objc_msgSend_existingAssetWithID_(*(void **)(a1 + 40), v23, @"FMSongBundleAssetID", v24, v25);
      uint64_t v26 = [FlexMobileAssetV2SongAsset alloc];
      uint64_t v27 = *v19;
      uint64_t v32 = objc_msgSend_contentVersion(v225, v28, v29, v30, v31);
      uint64_t v37 = objc_msgSend_compatibilityVersion(v225, v33, v34, v35, v36);
      v223 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v26, v38, (uint64_t)v27, 0, v3, v32, v37);
      if (objc_msgSend_isEqualToString_(*v19, v39, @"FMSongBundleAssetID", v40, v41))
      {
        v217 = [FlexSongProxy alloc];
        v221 = objc_msgSend_uid(*(void **)(a1 + 40), v45, v46, v47, v48);
        v222 = objc_msgSend_songName(*(void **)(a1 + 40), v49, v50, v51, v52);
        v220 = objc_msgSend_artistName(*(void **)(a1 + 40), v53, v54, v55, v56);
        v219 = objc_msgSend_tagIDs(*(void **)(a1 + 40), v57, v58, v59, v60);
        v218 = objc_msgSend_keywords(*(void **)(a1 + 40), v61, v62, v63, v64);
        uint64_t v69 = objc_msgSend_weightedKeywords(*(void **)(a1 + 40), v65, v66, v67, v68);
        char v74 = objc_msgSend_hidden(*(void **)(a1 + 40), v70, v71, v72, v73);
        char v81 = objc_msgSend_recalled(*(void **)(a1 + 40), v75, v76, v77, v78);
        if (v224)
        {
          v247[0] = v224;
          v247[1] = v223;
          uint64_t v82 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v79, (uint64_t)v247, 2, v80);
        }
        else
        {
          v246 = v223;
          uint64_t v82 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v79, (uint64_t)&v246, 1, v80);
        }
        uint64_t v97 = (void *)v82;
        uint64_t v98 = objc_msgSend_audioEncoderPresetName(*(void **)(a1 + 40), v83, v84, v85, v86);
        uint64_t v103 = objc_msgSend_metadataVersion(*(void **)(a1 + 40), v99, v100, v101, v102);
        uint64_t v108 = objc_msgSend_songFormat(*(void **)(a1 + 40), v104, v105, v106, v107);
        HIBYTE(v216) = v81;
        LOBYTE(v216) = v74;
        v110 = objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v217, v109, (uint64_t)v221, (uint64_t)v222, (uint64_t)v220, v219, v218, v69, v216, v97, v98, v103, v108);

        objc_msgSend_updateBackend_(*(void **)(a1 + 40), v111, (uint64_t)v110, v112, v113);
        v118 = objc_msgSend_uid(*(void **)(a1 + 40), v114, v115, v116, v117);
        objc_msgSend__loadBundledSongForSongID_((void *)v3, v119, (uint64_t)v118, v120, v121);
      }
      else
      {
        if (!objc_msgSend_isEqualToString_(*(void **)(a1 + 48), v42, @"FMSongArtworkAssetID", v43, v44))goto LABEL_22; {
        v92 = *(void **)(a1 + 40);
        }
        if (v224)
        {
          v245[0] = v224;
          v245[1] = v223;
          uint64_t v93 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v88, (uint64_t)v245, 2, v91);
        }
        else
        {
          v244 = v223;
          uint64_t v93 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v88, (uint64_t)&v244, 1, v91);
        }
        v122 = (void *)v93;
        objc_msgSend_updateAssets_(v92, v94, v93, v95, v96);

        v110 = objc_msgSend_uid(*(void **)(a1 + 40), v123, v124, v125, v126);
        objc_msgSend__loadBundledArtworkForSongID_((void *)v3, v127, (uint64_t)v110, v128, v129);
      }

LABEL_22:
      uint64_t v134 = objc_msgSend_purgeSync(*(void **)(a1 + 32), v88, v89, v90, v91);
      if (v134)
      {
        v135 = FlexLogForCategory(2uLL);
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          v140 = objc_msgSend_uid(*(void **)(a1 + 40), v136, v137, v138, v139);
          uint64_t v141 = *(void *)(a1 + 48);
          v145 = objc_msgSend__mobileAssetPurgeResultStringValue_((void *)v3, v142, v134, v143, v144);
          *(_DWORD *)buf = 138412802;
          v239 = v140;
          __int16 v240 = 2112;
          uint64_t v241 = v141;
          __int16 v242 = 2112;
          v243 = v145;
          _os_log_impl(&dword_217A2F000, v135, OS_LOG_TYPE_DEFAULT, "purge failed for %@ %@ error: %@", buf, 0x20u);
        }
      }
      uint64_t v150 = objc_msgSend_state(*(void **)(a1 + 32), v130, v131, v132, v133);
      v151 = *(void **)(a1 + 32);
      if (v150 == 3)
      {
        v152 = objc_msgSend_attributes(v151, v146, v147, v148, v149);
        v156 = objc_msgSend_objectForKeyedSubscript_(v152, v153, @"FMAssetType", v154, v155);
        uint64_t v237 = *(void *)(a1 + 56);
        v159 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v157, (uint64_t)&v237, 1, v158);
        v162 = objc_msgSend__mobileAssetsForAssetType_andUIDs_((void *)v3, v160, (uint64_t)v156, (uint64_t)v159, v161);

        v167 = objc_msgSend_set(MEMORY[0x263EFF9C0], v163, v164, v165, v166);
        long long v233 = 0u;
        long long v234 = 0u;
        long long v231 = 0u;
        long long v232 = 0u;
        id v168 = v162;
        uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v231, (uint64_t)v236, 16);
        if (v174)
        {
          uint64_t v175 = *(void *)v232;
          do
          {
            for (uint64_t i = 0; i != v174; ++i)
            {
              if (*(void *)v232 != v175) {
                objc_enumerationMutation(v168);
              }
              v177 = objc_msgSend_attributes(*(void **)(*((void *)&v231 + 1) + 8 * i), v170, v171, v172, v173);
              v181 = objc_msgSend_objectForKeyedSubscript_(v177, v178, @"uuid", v179, v180);

              if (v181) {
                objc_msgSend_addObject_(v167, v182, (uint64_t)v181, v183, v184);
              }
            }
            uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v170, (uint64_t)&v231, (uint64_t)v236, 16);
          }
          while (v174);
        }

        v188 = objc_msgSend__metadataMappingForUUIDSet_((void *)v3, v185, (uint64_t)v167, v186, v187);
        v192 = objc_msgSend_objectForKey_(v188, v189, *(void *)(a1 + 56), v190, v191);
        long long v229 = 0u;
        long long v230 = 0u;
        long long v227 = 0u;
        long long v228 = 0u;
        v193 = v168;
        id v199 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v227, (uint64_t)v235, 16);
        if (v199)
        {
          uint64_t v200 = *(void *)v228;
          while (2)
          {
            for (j = 0; j != v199; j = (char *)j + 1)
            {
              if (*(void *)v228 != v200) {
                objc_enumerationMutation(v193);
              }
              v202 = *(void **)(*((void *)&v227 + 1) + 8 * (void)j);
              if (objc_msgSend_state(v202, v195, v196, v197, v198) != 3)
              {
                id v199 = v202;
                goto LABEL_49;
              }
            }
            id v199 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v195, (uint64_t)&v227, (uint64_t)v235, 16);
            if (v199) {
              continue;
            }
            break;
          }
        }
LABEL_49:

        id v209 = *(id *)(a1 + 64);
        objc_sync_enter(v209);
        if (v199) {
          objc_msgSend__updateExistingSong_usingAsset_metadataAsset_forceUpdate_((void *)v3, v210, *(void *)(a1 + 40), (uint64_t)v199, (uint64_t)v192, 1);
        }
        objc_sync_exit(v209);
      }
      else
      {
        if (objc_msgSend_refreshState(v151, v146, v147, v148, v149))
        {
LABEL_53:

          goto LABEL_54;
        }
        v193 = FlexLogForCategory(2uLL);
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          v207 = objc_msgSend_uid(*(void **)(a1 + 40), v203, v204, v205, v206);
          uint64_t v208 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          v239 = v207;
          __int16 v240 = 2112;
          uint64_t v241 = v208;
          _os_log_impl(&dword_217A2F000, v193, OS_LOG_TYPE_DEFAULT, "refreshState failed for %@ %@", buf, 0x16u);
        }
      }

      goto LABEL_53;
    }
    objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge((void *)v3, v8, v9, v10, v11);
    objc_sync_exit(v4);
  }
  else
  {
    long long v87 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v87, OS_LOG_TYPE_DEFAULT, "attempted to purge but no cloud manager", buf, 2u);
    }
  }
LABEL_55:
}

void sub_217A4B348(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_217A4B374(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__runNextAsyncAssetDownloadAndPurge(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_217A4B5C4(uint64_t a1)
{
  v67[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v7 = objc_msgSend_songUID(*(void **)(a1 + 40), v2, v3, v4, v5);

      if (v7)
      {
        uint64_t v8 = *(void **)(a1 + 48);
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = objc_msgSend_songUID(*(void **)(a1 + 40), v2, v3, v4, v5);
        v67[0] = v10;
        uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v67, 1, v12);
        uint64_t v16 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(v8, v14, v9, (uint64_t)v13, v15);

        uint64_t v7 = objc_msgSend_assetWithNewestContentVersionInAssets_preferInstalled_(FlexMobileAssetManagerV2, v17, (uint64_t)v16, 1, v18);
        if (!v7)
        {
          uint64_t v19 = FlexLogForCategory(2uLL);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = objc_msgSend_songUID(*(void **)(a1 + 40), v20, v21, v22, v23);
            uint64_t v29 = objc_msgSend_assetID(*(void **)(a1 + 40), v25, v26, v27, v28);
            int v63 = 138412546;
            uint64_t v64 = v24;
            __int16 v65 = 2112;
            uint64_t v66 = v29;
            _os_log_impl(&dword_217A2F000, v19, OS_LOG_TYPE_DEFAULT, "cannot purge due to nil mobileAsset %@ %@", (uint8_t *)&v63, 0x16u);
          }
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v30 = *(void **)(a1 + 48);
    uint64_t v31 = objc_msgSend_songUID(*(void **)(a1 + 40), v2, v3, v4, v5);
    uint64_t v35 = objc_msgSend__existingSongForUID_(v30, v32, (uint64_t)v31, v33, v34);

    id v36 = WeakRetained[7];
    objc_sync_enter(v36);
    if (!v7) {
      goto LABEL_15;
    }
    if (objc_msgSend__isDownloadingAsset_(*(void **)(a1 + 48), v37, *(void *)(a1 + 40), v38, v39))
    {
      objc_msgSend_removeObject_(WeakRetained[9], v40, (uint64_t)v7, v41, v42);
      objc_msgSend_removeObject_(WeakRetained[10], v43, (uint64_t)v7, v44, v45);
      objc_msgSend_updateAsset_downloadProgress_error_(v35, v46, *(void *)(a1 + 40), 0, v47, 0.0);
    }
    if (objc_msgSend_containsObject_(WeakRetained[13], v40, (uint64_t)v7, v41, v42))
    {
      objc_sync_exit(v36);
    }
    else
    {
LABEL_15:
      objc_sync_exit(v36);

      if (objc_msgSend_assetStatus(*(void **)(a1 + 40), v48, v49, v50, v51) == 2) {
        objc_msgSend_cancelDownloadOfAsset_(*(void **)(a1 + 48), v52, *(void *)(a1 + 40), v53, v54);
      }
      id v55 = WeakRetained[7];
      objc_sync_enter(v55);
      if (v7) {
        objc_msgSend_addObject_(WeakRetained[12], v56, (uint64_t)v7, v57, v58);
      }
      objc_sync_exit(v55);

      objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge(*(void **)(a1 + 48), v59, v60, v61, v62);
    }
  }
}

void sub_217A4B88C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_217A4CD68(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_isEqualToString_(a2, (const char *)a2, (uint64_t)&stru_26C7FED08, a4, a5);
}

void sub_217A4CDD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A4D2BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_217A4DCFC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_sampleCount(v4, v6, v7, v8, v9);
  if (v10 >= objc_msgSend_sampleCount(v5, v11, v12, v13, v14))
  {
    uint64_t v20 = objc_msgSend_sampleCount(v4, v15, v16, v17, v18);
    uint64_t v19 = v20 > objc_msgSend_sampleCount(v5, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v19 = -1;
  }

  return v19;
}

void sub_217A4E51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_217A4E550(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  BOOL v10 = objc_msgSend_type(v5, v6, v7, v8, v9) == 2;

  return v10;
}

uint64_t sub_217A4E590(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_217A4E5A0(uint64_t a1)
{
}

uint64_t sub_217A4E5A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_segment(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_name(v3, v9, v10, v11, v12);
  if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v8, v14, (uint64_t)v13, v15, v16)) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = objc_msgSend_barsUsed(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v17, v18, v19, v20) - 1;
  }

  uint64_t v26 = objc_msgSend_segment(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v22, v23, v24, v25);
  uint64_t v28 = objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v27, (uint64_t)v26, (uint64_t)v3, v21, 1);

  return v28;
}

void sub_217A4E91C()
{
  id v10 = (id)objc_opt_new();
  for (uint64_t i = 0; i != 100; ++i)
  {
    id v4 = objc_msgSend_stringWithFormat_(NSString, v0, @"%ld", v1, v2, i);
    objc_msgSend_addObject_(v10, v5, (uint64_t)v4, v6, v7);
  }
  uint64_t v8 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v0, (uint64_t)v10, v1, v2);
  uint64_t v9 = (void *)qword_26ABF5FC8;
  qword_26ABF5FC8 = v8;
}

uint64_t sub_217A4F884(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_type(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_nameIndex(v6, v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v17, @"%lu", v18, v19, *(void *)(a1 + 32));
  unsigned int isEqualToString = objc_msgSend_isEqualToString_(v16, v21, (uint64_t)v20, v22, v23);

  if (v11 == 3) {
    uint64_t v25 = isEqualToString;
  }
  else {
    uint64_t v25 = 0;
  }

  return v25;
}

uint64_t sub_217A4F930(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_segment(v3, v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_indexOfObject_(*(void **)(a1 + 32), v9, (uint64_t)v3, v10, v11);
  if (v12 >= objc_msgSend_count(*(void **)(a1 + 32), v13, v14, v15, v16) - 1)
  {
    uint64_t v50 = 0;
    uint64_t v31 = 0;
    objc_msgSend_name(0, v17, v18, v19, v20);
  }
  else
  {
    unint64_t v21 = v12 + 1;
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v17, v12 + 1, v19, v20);
    uint64_t v31 = objc_msgSend_segment(v22, v23, v24, v25, v26);
    while (1)
    {
      if (v21 >= objc_msgSend_count(*(void **)(a1 + 32), v27, v28, v29, v30))
      {
        uint64_t v50 = 0;
        goto LABEL_9;
      }
      uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v32, v21, v33, v34);
      uint64_t v40 = objc_msgSend_segment(v35, v36, v37, v38, v39);
      uint64_t v45 = objc_msgSend_type(v40, v41, v42, v43, v44);

      if (v45 == 2) {
        break;
      }

      ++v21;
    }
    uint64_t v50 = objc_msgSend_segment(v35, v46, v47, v48, v49);

LABEL_9:
    objc_msgSend_name(v50, v51, v52, v53, v54);
  id v55 = };
  uint64_t v58 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v8, v56, (uint64_t)v55, 0, v57);

  if (v58
    && v31
    && (objc_msgSend_transitionSegmentName(v58, v59, v60, v61, v62),
        int v63 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_name(v31, v64, v65, v66, v67),
        uint64_t v68 = objc_claimAutoreleasedReturnValue(),
        char v72 = objc_msgSend_isEqualToString_(v63, v69, (uint64_t)v68, v70, v71),
        v68,
        v63,
        (v72 & 1) != 0))
  {
    uint64_t isEqualToString = 0;
  }
  else
  {
    char v74 = objc_msgSend_name(v8, v59, v60, v61, v62);
    uint64_t v79 = objc_msgSend_namePrefix(v8, v75, v76, v77, v78);
    uint64_t v82 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v74, v80, (uint64_t)v79, (uint64_t)&stru_26C7FED08, v81);

    long long v87 = objc_msgSend_nameStem(v8, v83, v84, v85, v86);
    uint64_t v90 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v82, v88, (uint64_t)v87, (uint64_t)&stru_26C7FED08, v89);

    if (objc_msgSend_isEqualToString_(v90, v91, *(void *)(a1 + 40), v92, v93))
    {
      uint64_t v98 = objc_msgSend_transitionSegmentName(v58, v94, v95, v96, v97);
      uint64_t v103 = objc_msgSend_segment(*(void **)(a1 + 48), v99, v100, v101, v102);
      uint64_t v108 = objc_msgSend_name(v103, v104, v105, v106, v107);
      uint64_t isEqualToString = objc_msgSend_isEqualToString_(v98, v109, (uint64_t)v108, v110, v111);
    }
    else
    {
      uint64_t isEqualToString = 0;
    }
  }
  return isEqualToString;
}

uint64_t sub_217A50164(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_name(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_name(*(void **)(a1 + 32), v12, v13, v14, v15);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v16, v18, v19);

  return isEqualToString;
}

uint64_t sub_217A51340(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_sliceable(a2, (const char *)a2, a3, a4, a5);
}

uint64_t sub_217A521C0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_priority(v4, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_priority(v5, v11, v12, v13, v14))
  {
    uint64_t v20 = objc_msgSend_priority(v4, v15, v16, v17, v18);
    uint64_t v19 = v20 < objc_msgSend_priority(v5, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v19 = -1;
  }

  return v19;
}

uint64_t sub_217A52244(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_sliceable(a2, (const char *)a2, a3, a4, a5);
}

uint64_t sub_217A5224C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_name(a2, (const char *)a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_name(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v12, (uint64_t)v11, v13, v14);

  return isEqualToString;
}

uint64_t sub_217A5249C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_sampleCount(v4, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_sampleCount(v5, v11, v12, v13, v14))
  {
    uint64_t v20 = objc_msgSend_sampleCount(v4, v15, v16, v17, v18);
    uint64_t v19 = v20 < objc_msgSend_sampleCount(v5, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v19 = -1;
  }

  return v19;
}

void sub_217A529BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_217A529F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_segment(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_name(v3, v9, v10, v11, v12);
  if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v8, v14, (uint64_t)v13, v15, v16)) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = objc_msgSend_barsUsed(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v17, v18, v19, v20) - 1;
  }

  uint64_t v26 = objc_msgSend_segment(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v22, v23, v24, v25);
  uint64_t v28 = objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v27, (uint64_t)v26, (uint64_t)v3, v21, 1);

  return v28;
}

BOOL sub_217A538B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_name(v5, v6, v7, v8, v9);
  BOOL v11 = v10 == 0;

  return v11;
}

BOOL sub_217A53900(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_name(v5, v6, v7, v8, v9);
  BOOL v11 = v10 == 0;

  return v11;
}

BOOL sub_217A53948(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_name(v5, v6, v7, v8, v9);
  BOOL v11 = v10 == 0;

  return v11;
}

uint64_t sub_217A54B88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_name(a2, (const char *)a2, a3, a4, a5);
  BOOL v11 = objc_msgSend_segment(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_name(v11, v12, v13, v14, v15);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v17, (uint64_t)v16, v18, v19);

  return isEqualToString;
}

void sub_217A54CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A54D0C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v23 = a2;
  uint64_t v11 = objc_msgSend_segment(v23, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v16 = (void *)v11;
    uint64_t v17 = objc_msgSend_segment(v23, v12, v13, v14, v15);
    uint64_t v22 = objc_msgSend_type(v17, v18, v19, v20, v21);

    if (v22 == 4)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

uint64_t sub_217A55958(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_segment(v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_nameIndex(v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_nameIndex(*(void **)(a1 + 32), v14, v15, v16, v17);
  if (objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21))
  {
    uint64_t v26 = objc_msgSend_segment(v3, v22, v23, v24, v25);
    uint64_t v31 = objc_msgSend_nameSuffix(v26, v27, v28, v29, v30);
    uint64_t v35 = objc_msgSend_isEqualToString_(v31, v32, @"a", v33, v34) ^ 1;
  }
  else
  {
    uint64_t v35 = 0;
  }

  return v35;
}

uint64_t sub_217A55D64(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_priority(v4, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_priority(v5, v11, v12, v13, v14))
  {
    uint64_t v20 = objc_msgSend_priority(v4, v15, v16, v17, v18);
    uint64_t v19 = v20 < objc_msgSend_priority(v5, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v19 = -1;
  }

  return v19;
}

BOOL sub_217A55DE8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_name(a2, (const char *)a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_name(*(void **)(a1 + 32), v7, v8, v9, v10);
  BOOL v12 = v6 == v11;

  return v12;
}

intptr_t sub_217A56B54(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_217A5895C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_217A2F000, log, OS_LOG_TYPE_DEBUG, "cannot call _actualOutroDurationForAssemblyList without first assembling body segments!", v1, 2u);
}

void sub_217A589A0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_217A2F000, log, OS_LOG_TYPE_DEBUG, "expected silence or outro at end. Algorithm bug?", buf, 2u);
}

void sub_217A589E0(void *a1, char *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_lastPathComponent(a1, a2, (uint64_t)a3, a4, a5);
  int v12 = 138412546;
  uint64_t v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = objc_msgSend_sampleCount(a2, v8, v9, v10, v11);
  _os_log_debug_impl(&dword_217A2F000, a3, OS_LOG_TYPE_DEBUG, "%@: kExtAudioFileProperty_FileLengthFrames is 1 sample longer than segment.sampleCount %lld", (uint8_t *)&v12, 0x16u);
}

void sub_217A58DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_217A58E10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_217A58E20(uint64_t a1)
{
}

void sub_217A58E28(void *a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = a1[6];
  id v56 = v7;
  if (v8 == objc_msgSend_sampleTime(v7, v9, v10, v11, v12)) {
    goto LABEL_5;
  }
  uint64_t v17 = a1[6];
  if (v17 <= objc_msgSend_sampleTime(v56, v13, v14, v15, v16)) {
    goto LABEL_7;
  }
  if (objc_msgSend_count(*(void **)(*(void *)(a1[5] + 8) + 40), v18, v19, v20, v21) - 1 <= a3)
  {
LABEL_5:
    objc_msgSend_value(v56, v13, v14, v15, v16);
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v55;
  }
  else
  {
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(*(void *)(a1[5] + 8) + 40), v13, a3 + 1, v15, v16);
    objc_msgSend_value(v56, v23, v24, v25, v26);
    float v28 = v27;
    objc_msgSend_value(v22, v29, v30, v31, v32);
    float v34 = v33;
    objc_msgSend_value(v56, v35, v36, v37, v38);
    uint64_t v40 = a1[6];
    float v45 = (float)(v34 - v39) * (float)(v40 - objc_msgSend_sampleTime(v56, v41, v42, v43, v44));
    uint64_t v50 = objc_msgSend_sampleTime(v22, v46, v47, v48, v49);
    *(float *)(*(void *)(a1[4] + 8) + 24) = v28
                                                + (float)(v45
                                                        / (float)(v50 - objc_msgSend_sampleTime(v56, v51, v52, v53, v54)));
  }
  *a4 = 1;
LABEL_7:
}

void sub_217A59100(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217A5911C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v35 = a2;
  uint64_t v11 = objc_msgSend_sampleTime(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v20 = objc_msgSend_sampleTime(v35, v12, v13, v14, v15);
  uint64_t v21 = *(void **)(a1 + 32);
  if (v11 == v20)
  {
    objc_msgSend_value(v21, v16, v17, v18, v19);
    objc_msgSend_setValue_(v35, v22, v23, v24, v25);
    *a4 = 1;
  }
  else
  {
    uint64_t v26 = objc_msgSend_sampleTime(v21, v16, v17, v18, v19);
    if (v26 > objc_msgSend_sampleTime(v35, v27, v28, v29, v30))
    {
      id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
      float v34 = WeakRetained;
      if (WeakRetained) {
        objc_msgSend_insertObject_atIndex_(WeakRetained[1], v32, *(void *)(a1 + 32), a3 + 1, v33);
      }
      *a4 = 1;
    }
  }
}

void sub_217A592BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_217A592E0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (objc_msgSend_sampleTime(v6, v7, v8, v9, v10) <= *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  uint64_t v15 = objc_msgSend_sampleTime(v6, v11, v12, v13, v14);

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v15;
}

void sub_217A594E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_217A5950C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v39 = v5;
    objc_msgSend_value(v5, v6, v7, v8, v9);
    if (v14 == *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v15 = objc_msgSend_volumeKeyFrames(*(void **)(a1 + 32), v10, v11, v12, v13);
      uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, a3 - 1, v17, v18);

      objc_msgSend_value(v19, v20, v21, v22, v23);
      float v25 = v24;
      objc_msgSend_value(v39, v26, v27, v28, v29);
      if (v25 == v33)
      {
        float v34 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (!v34)
        {
          uint64_t v35 = objc_opt_new();
          uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v37 = *(void **)(v36 + 40);
          *(void *)(v36 + 40) = v35;

          float v34 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend_addObject_(v34, v30, (uint64_t)v39, v31, v32);

        goto LABEL_9;
      }
    }
    objc_msgSend_value(v39, v10, v11, v12, v13);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v38;
LABEL_9:
    id v5 = v39;
  }
}

void sub_217A5B9AC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217A2F000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch genre:\n%@", (uint8_t *)&v2, 0xCu);
}

void sub_217A5BA24(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217A2F000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch region:\n%@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_217A5D1CC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_position(v4, v6, v7, v8, v9);
  if (v10 >= objc_msgSend_position(v5, v11, v12, v13, v14))
  {
    uint64_t v20 = objc_msgSend_position(v4, v15, v16, v17, v18);
    uint64_t v19 = v20 > objc_msgSend_position(v5, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v19 = -1;
  }

  return v19;
}

void sub_217A5E5F8(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (objc_msgSend_type(v10, v3, v4, v5, v6) == *(void *)(a1 + 40)) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v7, (uint64_t)v10, v8, v9);
  }
}

uint64_t sub_217A5E788(uint64_t a1, void *a2)
{
  id v27 = a2;
  if (objc_msgSend_type(v27, v3, v4, v5, v6) == *(void *)(a1 + 56))
  {
    id v10 = objc_msgSend_nameIndex(v27, (const char *)v27, v7, v8, v9);
    if (!objc_msgSend_isEqualToString_(v10, v11, *(void *)(a1 + 32), v12, v13))
    {

      goto LABEL_9;
    }
    if (*(void *)(a1 + 40))
    {
      uint64_t v18 = objc_msgSend_nameSuffix(v27, v14, v15, v16, v17);
      char isEqualToString = objc_msgSend_isEqualToString_(v18, v19, *(void *)(a1 + 40), v20, v21);

      float v25 = (const char *)v27;
      if ((isEqualToString & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_msgSend_addObject_(*(void **)(a1 + 48), v25, (uint64_t)v27, v23, v24);
  }
LABEL_9:
  return MEMORY[0x270F9A758]();
}

void sub_217A5E97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_217A5E994(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_217A5E9A4(uint64_t a1)
{
}

void sub_217A5E9AC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v11 = objc_msgSend_name(v16, v7, v8, v9, v10);
  int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *(void *)(a1 + 32), v13, v14);

  if (isEqualToString)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_217A5EE34(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_name(a1, a2, a3, a4, a5);
  int v7 = 138412290;
  uint64_t v8 = v6;
  _os_log_debug_impl(&dword_217A2F000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Relinking transitions for segment %@ because it is not Sliceable", (uint8_t *)&v7, 0xCu);
}

void sub_217A5EECC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_217A2F000, log, OS_LOG_TYPE_DEBUG, "Invalid sole marker", v1, 2u);
}

void sub_217A5EF10(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217A2F000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_217A5FFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_217A60018(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_217A60028(uint64_t a1)
{
}

void sub_217A60030(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v11 = objc_msgSend_values(v6, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_objectForKey_(v11, v12, @"SectionType", v13, v14);

  if (objc_msgSend_isEqualToString_(v15, v16, @"OUTRO", v17, v18))
  {
    if (v6)
    {
      objc_msgSend_timeRange(v6, v19, v20, v21, v22);
      uint64_t v23 = *(void *)(a1[4] + 8);
      *(_OWORD *)(v23 + 32) = v38[2];
      *(void *)(v23 + 48) = v39;
      objc_msgSend_timeRange(v6, v24, v25, v26, v27);
    }
    else
    {
      uint64_t v28 = *(void **)(a1[4] + 8);
      v28[4] = 0;
      v28[5] = 0;
      v28[6] = 0;
      long long v37 = 0u;
      memset(v38, 0, 32);
    }
    uint64_t v29 = *(void *)(a1[5] + 8);
    *(void *)(v29 + 48) = *((void *)&v38[1] + 1);
    *(_OWORD *)(v29 + 32) = *(_OWORD *)((char *)v38 + 8);
    uint64_t v30 = objc_msgSend_values(v6, v19, v20, v21, v22, v37, *(void *)&v38[0]);
    uint64_t v34 = objc_msgSend_objectForKey_(v30, v31, @"OutroEarlyFade", v32, v33);
    uint64_t v35 = *(void *)(a1[6] + 8);
    uint64_t v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    *a4 = 1;
  }
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x270EE20D8](inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x270EE20F0](inAudioFile, *(void *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetPropertyInfo(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *outDataSize, UInt32 *isWritable)
{
  return MEMORY[0x270EE20F8](inAudioFile, *(void *)&inPropertyID, outDataSize, isWritable);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x270EE2118](inFileRef, inPermissions, *(void *)&inFileTypeHint, outAudioFile);
}

void CFRelease(CFTypeRef cf)
{
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x270EE7DD8](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x270EE7E60](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x270EE7E68](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x270EE7E80](range, time);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x270EE2368](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x270EE2370](inExtAudioFile, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270EE2390](inURL, outExtAudioFile);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F05600](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x270F05638](target, queue);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}