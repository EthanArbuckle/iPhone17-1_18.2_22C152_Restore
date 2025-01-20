@interface _IMPingStatisticsCollector
- (BOOL)logStatsToFile:(id)a3 error:(id *)a4;
- (_IMPingStatisticsCollector)init;
- (double)_computeMedianTime:(id)a3;
- (double)_computeStandardDeviation:(id)a3 numPings:(int)a4 averageRTT:(double)a5;
- (id)pingStats;
- (id)pingStatsForLastNSeconds:(double)a3;
- (timeval)timeSentForPacket:(int)a3;
- (void)addEchoPacket:(int)a3 packetTimestamp:(timeval)a4 error:(int)a5;
- (void)addEchoReplyPacket:(int)a3;
- (void)dealloc;
- (void)timeoutOldSequenceNumbers:(double)a3;
@end

@implementation _IMPingStatisticsCollector

- (_IMPingStatisticsCollector)init
{
  v13.receiver = self;
  v13.super_class = (Class)_IMPingStatisticsCollector;
  v2 = [(_IMPingStatisticsCollector *)&v13 init];
  if (v2)
  {
    for (uint64_t i = 8; i != 1288; i += 8)
    {
      v4 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = 0;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v8 = objc_msgSend_initWithString_(v5, v6, (uint64_t)&stru_1EE231AD8, v7);
    stringToWriteToFile = v2->_stringToWriteToFile;
    v2->_stringToWriteToFile = (NSMutableString *)v8;

    v10 = objc_alloc_init(IMPingStatistics);
    stats = v2->_stats;
    v2->_stats = v10;
  }
  return v2;
}

- (void)addEchoPacket:(int)a3 packetTimestamp:(timeval)a4 error:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  timeval v36 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [_IMPingPacketData alloc];
  v10 = objc_msgSend_initWithSequeneceNumber_timesent_error_(v8, v9, v6, (uint64_t)&v36, v5);
  v11 = &v7->super.isa + (int)v6 % 160;
  Class v14 = v11[1];
  objc_super v13 = (id *)(v11 + 1);
  Class v12 = v14;
  if (v14)
  {
    *objc_super v13 = 0;
  }
  objc_storeStrong(v13, v10);
  uint64_t v17 = objc_msgSend__addTransmittedPacket_(v7->_stats, v15, v5 == 0, v16);
  if (v5)
  {
    v18 = (void *)MEMORY[0x192FDE5A0](v17);
    v21 = objc_msgSend_stringWithFormat_(NSString, v19, @"error (%d) sending sequence %d", v20, v5, v6, v36.tv_sec, *(void *)&v36.tv_usec);
    v22 = sub_1918DDCB8();
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v23, (uint64_t)v22, v24);
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v25, @":", v26);
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v27, (uint64_t)v21, v28);
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v29, @"\n", v30);
    if (_IMWillLog(@"IMPingTest")) {
      _IMAlwaysLog(0, @"IMPingTest", @"%@:%@", v31, v32, v33, v34, v35, (char)v22);
    }
  }

  objc_sync_exit(v7);
}

- (void)dealloc
{
  for (uint64_t i = 8; i != 1288; i += 8)
  {
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_IMPingStatisticsCollector;
  [(_IMPingStatisticsCollector *)&v5 dealloc];
}

- (timeval)timeSentForPacket:(int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = v4->_timestampArray[a3 % 160];
  if (objc_msgSend_sequenceNumber(v5, v6, v7, v8) == a3)
  {
    uint64_t v12 = objc_msgSend_timeSent(v5, v9, v10, v11);
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v12 = 0;
  }
  objc_sync_exit(v4);

  __darwin_time_t v15 = v12;
  uint64_t v16 = v14;
  result.tv_usec = v16;
  result.tv_sec = v15;
  return result;
}

- (void)addEchoReplyPacket:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  obj = self;
  objc_sync_enter(obj);
  timestampArray = obj->_timestampArray;
  int v5 = (int)v3 % 160;
  v9 = obj->_timestampArray[(int)v3 % 160];
  if (obj->_roundTriptimes)
  {
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    roundTriptimes = obj->_roundTriptimes;
    obj->_roundTriptimes = v10;

    if (!v9) {
      goto LABEL_10;
    }
  }
  if (objc_msgSend_sequenceNumber(v9, v6, v7, v8) == v3)
  {
    objc_msgSend__returnPacketArrived(v9, v12, v13, v14);
    objc_msgSend_rtt(v9, v15, v16, v17);
    double v21 = v20;
    if (v20 < 20.0)
    {
      objc_msgSend_addObject_(obj->_roundTriptimes, v18, (uint64_t)v9, v19);
      v22 = timestampArray[v5];
      timestampArray[v5] = 0;

      v23 = (void *)MEMORY[0x192FDE5A0]();
      uint64_t v26 = objc_msgSend_stringWithFormat_(NSString, v24, @"sequence %d rtt %f s", v25, v3, *(void *)&v21);
      v27 = sub_1918DDCB8();
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v28, (uint64_t)v27, v29);
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v30, @":", v31);
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v32, (uint64_t)v26, v33);
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v34, @"\n", v35);
      if (_IMWillLog(@"IMPingTest")) {
        _IMAlwaysLog(0, @"IMPingTest", @"%@:%@", v36, v37, v38, v39, v40, (char)v27);
      }

      objc_msgSend__addReceivedPacket_(obj->_stats, v41, v42, v43, v21);
    }
  }
LABEL_10:

  objc_sync_exit(obj);
}

- (void)timeoutOldSequenceNumbers:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  for (uint64_t i = 8; i != 1288; i += 8)
  {
    id v5 = *(id *)((char *)&obj->super.isa + i);
    if ((objc_msgSend_timedOut(v5, v6, v7, v8) & 1) == 0)
    {
      objc_msgSend__markPacketAsTimedOut_(v5, v9, v10, v11, a3);
      if (!objc_msgSend_error(v5, v12, v13, v14))
      {
        if (objc_msgSend_timedOut(v5, v15, v16, v17))
        {
          v18 = (void *)MEMORY[0x192FDE5A0]();
          uint64_t v19 = NSString;
          uint64_t v23 = objc_msgSend_sequenceNumber(v5, v20, v21, v22);
          uint64_t v27 = objc_msgSend_error(v5, v24, v25, v26);
          uint64_t v30 = objc_msgSend_stringWithFormat_(v19, v28, @"sequence number %d timeout, error = %d", v29, v23, v27);
          uint64_t v31 = sub_1918DDCB8();
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v32, (uint64_t)v31, v33);
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v34, @":", v35);
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v36, (uint64_t)v30, v37);
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v38, @"\n", v39);
          if (_IMWillLog(@"IMPingTest")) {
            _IMAlwaysLog(0, @"IMPingTest", @"%@:%@", v40, v41, v42, v43, v44, (char)v31);
          }
        }
      }
    }
  }
  objc_sync_exit(obj);
}

- (BOOL)logStatsToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = objc_sync_enter(v7);
  v9 = (void *)MEMORY[0x192FDE5A0](v8);
  uint64_t v10 = (void *)MEMORY[0x192FDE5A0]();
  uint64_t v11 = NSString;
  __darwin_time_t v15 = objc_msgSend_pingStats(v7, v12, v13, v14);
  v18 = objc_msgSend_stringWithFormat_(v11, v16, @"%@", v17, v15);

  uint64_t v19 = sub_1918DDCB8();
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v20, (uint64_t)v19, v21);
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v22, @":", v23);
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v24, (uint64_t)v18, v25);
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v26, @"\n", v27);
  if (_IMWillLog(@"IMPingTest")) {
    _IMAlwaysLog(0, @"IMPingTest", @"%@:%@", v28, v29, v30, v31, v32, (char)v19);
  }

  if (!v6)
  {
    id v36 = 0;
LABEL_9:
    BOOL v37 = 0;
    goto LABEL_10;
  }
  stringToWriteToFile = v7->_stringToWriteToFile;
  id v44 = 0;
  char v35 = objc_msgSend_writeToFile_atomically_encoding_error_(stringToWriteToFile, v33, (uint64_t)v6, 1, 4, &v44);
  id v36 = v44;
  if ((v35 & 1) == 0)
  {
    if (_IMWillLog(@"IMPingTest")) {
      _IMAlwaysLog(0, @"IMPingTest", @"Failed to write string to path %@", v38, v39, v40, v41, v42, (char)v6);
    }
    goto LABEL_9;
  }
  BOOL v37 = 1;
LABEL_10:
  objc_sync_exit(v7);

  if (a4 && v36) {
    *a4 = v36;
  }

  return v37;
}

- (id)pingStats
{
  v2 = self;
  objc_sync_enter(v2);
  stats = v2->_stats;
  objc_msgSend__computeMedianTime_(v2, v4, (uint64_t)v2->_roundTriptimes, v5);
  objc_msgSend__setMedianRoundtripTime_(stats, v6, v7, v8);
  v9 = v2->_stats;
  uint64_t roundTriptimes = (uint64_t)v2->_roundTriptimes;
  uint64_t v14 = objc_msgSend_numPingsReceived(v9, v11, v12, v13);
  objc_msgSend_averageRoundtripTime(v2->_stats, v15, v16, v17);
  objc_msgSend__computeStandardDeviation_numPings_averageRTT_(v2, v18, roundTriptimes, v14);
  objc_msgSend__setStandardDeviationRoundtripTime_(v9, v19, v20, v21);
  objc_sync_exit(v2);

  uint64_t v25 = objc_msgSend_copy(v2->_stats, v22, v23, v24);
  return v25;
}

- (id)pingStatsForLastNSeconds:(double)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v5, v6, (int)a3, v7);
  v9 = objc_alloc_init(IMPingStatistics);
  uint64_t v10 = self;
  objc_sync_enter(v10);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v11 = v10->_roundTriptimes;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v58, (uint64_t)v62, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_timeSent(v19, v13, v14, v15);
        objc_msgSend_rtt(v19, v21, v22, v23, v20, v21, (void)v58);
        if (v24 > 0.0 && sub_1918DD538((uint64_t)&v57) < a3)
        {
          BOOL v25 = objc_msgSend_error(v19, v13, v14, v15) == 0;
          objc_msgSend__addTransmittedPacket_(v9, v26, v25, v27);
          objc_msgSend_rtt(v19, v28, v29, v30);
          objc_msgSend__addReceivedPacket_(v9, v31, v32, v33);
          BOOL v37 = objc_msgSend_copy(v19, v34, v35, v36);
          objc_msgSend_addObject_(v8, v38, (uint64_t)v37, v39);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v58, (uint64_t)v62, 16);
    }
    while (v16);
  }

  uint64_t v43 = objc_msgSend_numPingsReceived(v9, v40, v41, v42);
  objc_msgSend_averageRoundtripTime(v9, v44, v45, v46);
  objc_msgSend__computeStandardDeviation_numPings_averageRTT_(v10, v47, (uint64_t)v8, v43);
  objc_msgSend__setStandardDeviationRoundtripTime_(v9, v48, v49, v50);
  objc_msgSend__computeMedianTime_(v10, v51, (uint64_t)v8, v52);
  objc_msgSend__setMedianRoundtripTime_(v9, v53, v54, v55);
  objc_sync_exit(v10);

  return v9;
}

- (double)_computeMedianTime:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    objc_msgSend_sortUsingComparator_(v3, v7, (uint64_t)&unk_1EE22FE58, v8);
    unint64_t v12 = objc_msgSend_count(v3, v9, v10, v11);
    uint64_t v15 = objc_msgSend_objectAtIndex_(v3, v13, v12 >> 1, v14);
    objc_msgSend_rtt(v15, v16, v17, v18);
    double v20 = v19;
  }
  else
  {
    double v20 = 0.0;
  }

  return v20;
}

- (double)_computeStandardDeviation:(id)a3 numPings:(int)a4 averageRTT:(double)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v24;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (!objc_msgSend_error(v17, v10, v11, v12))
        {
          objc_msgSend_rtt(v17, v10, v11, v12);
          double v15 = v15 + (v18 - a5) * (v18 - a5);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }
  if ((int)objc_msgSend_numPingsReceived(self->_stats, v10, v11, v12) >= 1) {
    double v15 = sqrt(v15 / (double)(int)objc_msgSend_numPingsReceived(self->_stats, v19, v20, v21));
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_stringToWriteToFile, 0);
  objc_storeStrong((id *)&self->_roundTriptimes, 0);
  uint64_t v3 = 1280;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end