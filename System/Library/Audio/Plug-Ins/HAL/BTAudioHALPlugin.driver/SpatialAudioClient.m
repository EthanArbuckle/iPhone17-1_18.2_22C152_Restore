@interface SpatialAudioClient
- ($09AED28DA01A4B4CD63B1271B5E0322A)HighestQualityFormat;
- (BOOL)disableControlCentreUpdate;
- (BOOL)isActiveAudioQueue;
- (SpatialAudioClient)initWithPid:(int)a3 deviceID:(unsigned int)a4;
- (id).cxx_construct;
- (int)hostProcess;
- (int)spatialAudioHeadTrackingUserSelection;
- (int)spatialAudioUserSelection;
- (unsigned)numActiveQueue;
- (unsigned)spatialNonUIRefCount;
- (unsigned)spatialRefCount;
- (void)ReleaseSpatialAudioQueueInfo;
- (void)SpatialAudioClientProcExitHandler;
- (void)UpdateSpatialAudioQueueInfo:(id)a3;
- (void)cancelExitHandler;
- (void)dealloc;
- (void)dercrementRefCount;
- (void)incrementRefCount;
- (void)resetNonUIRefCount;
- (void)resetRefCount;
- (void)setDisableControlCentreUpdate:(BOOL)a3;
- (void)setHostProcess:(int)a3;
- (void)setNonUIRefCount;
- (void)setSpatialAudioHeadTrackingUserSelection:(int)a3;
- (void)setSpatialAudioUserSelection:(int)a3;
- (void)updateHighestQualityFormat;
- (void)updateHostProcess:(int)a3;
@end

@implementation SpatialAudioClient

- (SpatialAudioClient)initWithPid:(int)a3 deviceID:(unsigned int)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SpatialAudioClient;
  v6 = [(SpatialAudioClient *)&v17 init];
  v7 = (SpatialAudioClient *)v6;
  if (v6)
  {
    v6[96] = 0;
    *((void *)v6 + 14) = 0xFF00000000;
    *((_DWORD *)v6 + 30) = 255;
    *((_DWORD *)v6 + 25) = 0;
    *((_DWORD *)v6 + 26) = 0;
    *((_DWORD *)v6 + 4) = a3;
    *((_DWORD *)v6 + 5) = a4;
    *((void *)v6 + 1) = 0;
    *(void *)(v6 + 124) = 0;
    *((_DWORD *)v6 + 33) = 0;
    *((void *)v6 + 3) = objc_alloc_init((Class)NSMutableDictionary);
    v8 = qword_A1AD0;
    if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Allocating Audio Client for PID %d", buf, 8u);
    }
    *(void *)buf = 0;
    uint64_t v19 = 0;
    sub_5CDCC((uint64_t)buf, (uint64_t)&v7->clientMutex);
    v9 = sub_455A8(qword_A2350, v7->deviceID);
    if (v9)
    {
      v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, v9);
      v11 = v10;
      if (v10)
      {
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_21C68;
        handler[3] = &unk_8DF20;
        int v16 = a3;
        handler[4] = v7;
        handler[5] = v10;
        dispatch_source_set_event_handler(v10, handler);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_220D8;
        v13[3] = &unk_8DF20;
        v13[4] = v11;
        v13[5] = v7;
        int v14 = a3;
        dispatch_source_set_cancel_handler(v11, v13);
        dispatch_resume(v11);
      }
      v7->exit_handler = (OS_dispatch_source *)v11;
    }
    sub_5CF10(buf);
  }
  else if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_ERROR))
  {
    sub_65C34();
  }
  return v7;
}

- (BOOL)isActiveAudioQueue
{
  return [(NSMutableDictionary *)self->audioQueueDict count] == 0;
}

- (void)UpdateSpatialAudioQueueInfo:(id)a3
{
  unint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  uint64_t v6 = *(void *)&a3.var0 >> 40;
  unsigned __int8 v7 = BYTE2(a3.var1);
  int var1_high = HIBYTE(a3.var1);
  buf[0] = HIBYTE(a3.var1);
  int var3 = a3.var3;
  buf[1] = BYTE2(a3.var1);
  buf[2] = BYTE1(a3.var1);
  buf[3] = a3.var1;
  v35[0] = 0;
  id v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%d-%d-%s", *(void *)&a3.var0, a3.var3, buf);
  v33[0] = 0;
  v33[1] = 0;
  sub_5CDCC((uint64_t)v33, (uint64_t)&self->clientMutex);
  unint64_t v10 = v3 >> 16;
  unsigned int v11 = v3;
  v12 = qword_A1AD0;
  if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "Enabled";
    *(_DWORD *)buf = 67109890;
    *(_WORD *)&v35[4] = 2082;
    *(_DWORD *)v35 = v4;
    if (!v11) {
      v13 = "Disabled";
    }
    *(void *)&v35[6] = v13;
    __int16 v36 = 1024;
    LODWORD(v37[0]) = var3;
    WORD2(v37[0]) = 1024;
    *(_DWORD *)((char *)v37 + 6) = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[ %d ] Spatial Audio Queue HeadTracked : %{public}s Channels=%d Spatial Status = %d", buf, 0x1Eu);
  }
  if (!v11)
  {
    unsigned int v22 = (var1_high << 24) | (v7 << 16) | (v6 << 8) | BYTE4(v4);
    if (!v22)
    {
      v29 = qword_A1AD0;
      if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(NSMutableDictionary *)self->audioQueueDict count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v35 = v4;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v30;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "[%d] Clear up all queues available queues = %lu", buf, 0x12u);
      }
      [(SpatialAudioClient *)self ReleaseSpatialAudioQueueInfo];
      goto LABEL_24;
    }
    id v23 = [(NSMutableDictionary *)self->audioQueueDict objectForKey:v32];
    if (v23
      && (objc_msgSend(v23, "updateStreamInfo:", v4 | ((unint64_t)v22 << 32), (v10 << 16) | (var3 << 8)) & 1) == 0)
    {
      [(NSMutableDictionary *)self->audioQueueDict removeObjectForKey:v32];
      v24 = qword_A1AD0;
      if (!os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      id v31 = [(NSMutableDictionary *)self->audioQueueDict count];
      *(_DWORD *)buf = 138412802;
      *(void *)v35 = v32;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = 0;
      __int16 v36 = 2048;
      v37[0] = v31;
      v26 = "Removed Audio Queue Entry %@ : %d available queues = %lu";
    }
    else
    {
      v24 = qword_A1AD0;
      if (!os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      id v25 = [(NSMutableDictionary *)self->audioQueueDict count];
      *(_DWORD *)buf = 138412802;
      *(void *)v35 = v32;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = 0;
      __int16 v36 = 2048;
      v37[0] = v25;
      v26 = "Decremented Ref for Audio Queue Entry %@ : %d available queues = %lu";
    }
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x1Cu);
LABEL_23:
    if ([(NSMutableDictionary *)self->audioQueueDict count]) {
      goto LABEL_25;
    }
LABEL_24:
    self->_spatialRefCount = 0;
    goto LABEL_25;
  }
  id v14 = [(NSMutableDictionary *)self->audioQueueDict objectForKey:v32];
  v15 = v14;
  if (v14)
  {
    [v14 streamInfo];
    unsigned __int8 v17 = v16;
    objc_msgSend(v15, "updateStreamInfo:", v4 | ((unint64_t)((var1_high << 24) | (v7 << 16) | (v6 << 8) | BYTE4(v4)) << 32), (v10 << 16) | (var3 << 8) | v11);
    uint64_t v18 = qword_A1AD0;
    if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v35 = v32;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = v17;
      __int16 v36 = 1024;
      LODWORD(v37[0]) = v11;
      uint64_t v19 = "Updated Audio Queue Entry %@ :%d -> %d";
      v20 = v18;
      uint32_t v21 = 24;
LABEL_16:
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
  }
  else
  {
    v27 = -[SpatialAudioQueue initWithStreamInfo:]([SpatialAudioQueue alloc], "initWithStreamInfo:", v4 | ((unint64_t)((var1_high << 24) | (v7 << 16) | (v6 << 8) | BYTE4(v4)) << 32), (v10 << 16) | (var3 << 8) | v11);
    [(NSMutableDictionary *)self->audioQueueDict setObject:v27 forKey:v32];

    uint64_t v28 = qword_A1AD0;
    if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v35 = v32;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = v11;
      uint64_t v19 = "Created Audio Queue Entry %@ : %d";
      v20 = v28;
      uint32_t v21 = 18;
      goto LABEL_16;
    }
  }
LABEL_25:
  [(SpatialAudioClient *)self updateHighestQualityFormat];

  sub_5CF10(v33);
}

- (void)ReleaseSpatialAudioQueueInfo
{
  unint64_t v3 = qword_A1AD0;
  if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
  {
    int clientPid = self->clientPid;
    id v5 = [(NSMutableDictionary *)self->audioQueueDict count];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = clientPid;
    LOWORD(v17[0]) = 2048;
    *(void *)((char *)v17 + 2) = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[ %d ] Clearing up all Audio Queue entries, Number of queues %lu ", buf, 0x12u);
  }
  *(void *)buf = 0;
  v17[0] = 0;
  sub_5CDCC((uint64_t)buf, (uint64_t)&self->clientMutex);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMutableDictionary *)self->audioQueueDict allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(NSMutableDictionary *)self->audioQueueDict objectForKey:v10]) {
          [(NSMutableDictionary *)self->audioQueueDict removeObjectForKey:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  sub_5CF10(buf);
}

- (void)updateHostProcess:(int)a3
{
  v5[0] = 0;
  v5[1] = 0;
  sub_5CDCC((uint64_t)v5, (uint64_t)&self->clientMutex);
  self->_hostProcess = a3;
  sub_5CF10(v5);
}

- (void)SpatialAudioClientProcExitHandler
{
  self->exit_handler = 0;
}

- (void)updateHighestQualityFormat
{
  v54[0] = 0;
  v54[1] = 0;
  sub_5CDCC((uint64_t)v54, (uint64_t)&self->clientMutex);
  self->_numActiveQueue = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  audioQueueDict = self->audioQueueDict;
  id v4 = [(NSMutableDictionary *)audioQueueDict countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (!v4)
  {
    *(_DWORD *)&self->_HighestQualityFormat.mSpatializationStatus = 0;
    *(void *)&self->_HighestQualityFormat.mClientProcessID = 0;
    goto LABEL_44;
  }
  id v5 = 0;
  uint64_t v6 = *(void *)v51;
  do
  {
    id v7 = 0;
    do
    {
      if (*(void *)v51 != v6) {
        objc_enumerationMutation(audioQueueDict);
      }
      id v8 = [(NSMutableDictionary *)self->audioQueueDict objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * (void)v7)];
      v9 = v8;
      if (!v8) {
        goto LABEL_20;
      }
      [v8 streamInfo];
      if ((v10 & 0x1000000) != 0
        || ([v9 streamInfo], v11 == 2)
        || ([v9 streamInfo], v12 == 4))
      {
        if (!self->_disableControlCentreUpdate)
        {
          uint64_t v19 = v9;
          if (v5)
          {
            [v5 streamInfo];
            if (v20 != 4)
            {
              [v5 streamInfo];
              if (v21 != 2)
              {
                [v5 streamInfo];
                if (v22 != 5)
                {
                  [v9 streamInfo];
                  uint64_t v19 = v9;
                  if (v33 == 4) {
                    goto LABEL_21;
                  }
                  [v9 streamInfo];
                  uint64_t v19 = v9;
                  if (v34 == 2) {
                    goto LABEL_21;
                  }
                  [v9 streamInfo];
                  uint64_t v19 = v9;
                  if (v35 == 5) {
                    goto LABEL_21;
                  }
                  goto LABEL_36;
                }
              }
            }
            [v5 streamInfo];
            unsigned __int8 v24 = v23;
            [v9 streamInfo];
            BOOL v26 = v24 >= v25;
            uint64_t v19 = v9;
            if (!v26) {
              goto LABEL_21;
            }
            [v5 streamInfo];
            unsigned int v28 = v27;
            [v9 streamInfo];
            if (((v29 ^ v28) & 0xFF00) != 0) {
              goto LABEL_20;
            }
            [v9 streamInfo];
            if (v30 == 1 || ([v9 streamInfo], v31 == 2))
            {
              [v9 streamInfo];
              if (v32 == 2) {
                uint64_t v19 = v9;
              }
              else {
                uint64_t v19 = v5;
              }
              goto LABEL_21;
            }
            [v9 streamInfo];
            if (v36 == 3 || ([v9 streamInfo], v37 == 4))
            {
              [v9 streamInfo];
              uint64_t v19 = v9;
              if (v38 != 4)
              {
LABEL_36:
                [v5 streamInfo];
                unsigned __int8 v40 = v39;
                [v9 streamInfo];
                if (v40 >= v41) {
                  uint64_t v19 = v5;
                }
                else {
                  uint64_t v19 = v9;
                }
              }
            }
            else
            {
LABEL_20:
              uint64_t v19 = v5;
            }
          }
LABEL_21:
          self->_numActiveQueue += [v9 audioQueueRef];
          id v5 = v19;
          goto LABEL_22;
        }
      }
      long long v13 = qword_A1AD0;
      if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [v9 streamInfo];
        [v9 streamInfo];
        unsigned int v16 = v15;
        [v9 streamInfo];
        BOOL disableControlCentreUpdate = self->_disableControlCentreUpdate;
        *(_DWORD *)buf = 67109888;
        unsigned int v56 = v14;
        __int16 v57 = 1024;
        int v58 = HIBYTE(v16) & 1;
        __int16 v59 = 1024;
        int v60 = v18;
        __int16 v61 = 1024;
        LODWORD(v62) = disableControlCentreUpdate;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[ %d ]Highest quality format ignored mContentspatializable %d mSpatializationStatus %d _disableControlCentreUpdate %d", buf, 0x1Au);
      }
LABEL_22:
      id v7 = (char *)v7 + 1;
    }
    while (v4 != v7);
    id v42 = [(NSMutableDictionary *)audioQueueDict countByEnumeratingWithState:&v50 objects:v63 count:16];
    id v4 = v42;
  }
  while (v42);
  *(_DWORD *)&self->_HighestQualityFormat.mSpatializationStatus = 0;
  *(void *)&self->_HighestQualityFormat.mClientProcessID = 0;
  if (v5)
  {
    id v43 = [v5 streamInfo];
    int v44 = HIDWORD(v43);
    __int16 v46 = v45;
    *(void *)&self->_HighestQualityFormat.mClientProcessID = v43;
    *(_DWORD *)&self->_HighestQualityFormat.mSpatializationStatus = v45;
    v47 = qword_A1AD0;
    if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
    {
      int clientPid = self->clientPid;
      v49[0] = HIBYTE(v44);
      v49[1] = BYTE2(v44);
      v49[2] = BYTE1(v44);
      v49[3] = v44;
      v49[4] = 0;
      *(_DWORD *)buf = 67109890;
      unsigned int v56 = clientPid;
      __int16 v57 = 1024;
      int v58 = v46;
      __int16 v59 = 1024;
      int v60 = HIBYTE(v46);
      __int16 v61 = 2082;
      v62 = v49;
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "[ %d ]Highest quality format Status = %d Channels = %d Format ID = %{public}s", buf, 0x1Eu);
    }
  }
LABEL_44:
  sub_5CF10(v54);
}

- (void)incrementRefCount
{
  unsigned int v3 = [(NSMutableDictionary *)self->audioQueueDict count];
  v6[0] = 0;
  v6[1] = 0;
  sub_5CDCC((uint64_t)v6, (uint64_t)&self->clientMutex);
  unsigned int spatialRefCount = self->_spatialRefCount;
  if (spatialRefCount >= v3)
  {
    id v5 = qword_A1AD0;
    if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v8 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Spatial Enable Exceed number of Qs %d", buf, 8u);
    }
  }
  else
  {
    self->_unsigned int spatialRefCount = spatialRefCount + 1;
  }
  sub_5CF10(v6);
}

- (void)dercrementRefCount
{
  v4[0] = 0;
  v4[1] = 0;
  sub_5CDCC((uint64_t)v4, (uint64_t)&self->clientMutex);
  unsigned int spatialRefCount = self->_spatialRefCount;
  if (spatialRefCount) {
    self->_unsigned int spatialRefCount = spatialRefCount - 1;
  }
  sub_5CF10(v4);
}

- (void)resetRefCount
{
  v3[0] = 0;
  v3[1] = 0;
  sub_5CDCC((uint64_t)v3, (uint64_t)&self->clientMutex);
  self->_unsigned int spatialRefCount = 0;
  sub_5CF10(v3);
}

- (void)setNonUIRefCount
{
  v3[0] = 0;
  v3[1] = 0;
  sub_5CDCC((uint64_t)v3, (uint64_t)&self->clientMutex);
  self->_spatialNonUIRefCount = 1;
  sub_5CF10(v3);
}

- (void)resetNonUIRefCount
{
  v3[0] = 0;
  v3[1] = 0;
  sub_5CDCC((uint64_t)v3, (uint64_t)&self->clientMutex);
  self->_spatialNonUIRefCount = 1;
  sub_5CF10(v3);
}

- (void)cancelExitHandler
{
  exit_handler = self->exit_handler;
  if (exit_handler)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->exit_handler))
    {
      id v4 = qword_A1AD0;
      if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
      {
        int clientPid = self->clientPid;
        v6[0] = 67109120;
        v6[1] = clientPid;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[ %d ] Cancelling Audio client Spatial Dispatch Block", (uint8_t *)v6, 8u);
        exit_handler = self->exit_handler;
      }
      dispatch_source_cancel(exit_handler);
    }
    self->exit_handler = 0;
  }
}

- (void)dealloc
{
  unsigned int v3 = qword_A1AD0;
  if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
  {
    int clientPid = self->clientPid;
    *(_DWORD *)buf = 67109120;
    int v8 = clientPid;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Release Audio Client for PID %d", buf, 8u);
  }
  [(SpatialAudioClient *)self ReleaseSpatialAudioQueueInfo];
  audioQueueDict = self->audioQueueDict;
  if (audioQueueDict) {

  }
  v6.receiver = self;
  v6.super_class = (Class)SpatialAudioClient;
  [(SpatialAudioClient *)&v6 dealloc];
}

- (unsigned)spatialRefCount
{
  return self->_spatialRefCount;
}

- (unsigned)spatialNonUIRefCount
{
  return self->_spatialNonUIRefCount;
}

- (unsigned)numActiveQueue
{
  return self->_numActiveQueue;
}

- ($09AED28DA01A4B4CD63B1271B5E0322A)HighestQualityFormat
{
  objc_copyStruct(&v4, &self->_HighestQualityFormat, 12, 1, 0);
  uint64_t v2 = v4;
  int v3 = v5;
  result.var0 = v2;
  result.var1 = HIDWORD(v2);
  result.var2 = v3;
  result.int var3 = BYTE1(v3);
  result.var4 = BYTE2(v3);
  result.var5 = HIBYTE(v3);
  return result;
}

- (int)hostProcess
{
  return self->_hostProcess;
}

- (void)setHostProcess:(int)a3
{
  self->_hostProcess = a3;
}

- (BOOL)disableControlCentreUpdate
{
  return self->_disableControlCentreUpdate;
}

- (void)setDisableControlCentreUpdate:(BOOL)a3
{
  self->_BOOL disableControlCentreUpdate = a3;
}

- (int)spatialAudioUserSelection
{
  return self->_spatialAudioUserSelection;
}

- (void)setSpatialAudioUserSelection:(int)a3
{
  self->_spatialAudioUserSelection = a3;
}

- (int)spatialAudioHeadTrackingUserSelection
{
  return self->_spatialAudioHeadTrackingUserSelection;
}

- (void)setSpatialAudioHeadTrackingUserSelection:(int)a3
{
  self->_spatialAudioHeadTrackingUserSelection = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end