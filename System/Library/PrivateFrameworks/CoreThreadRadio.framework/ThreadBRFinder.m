@interface ThreadBRFinder
- (BOOL)disPatchStartScanToMatchListOfPreferredNetworkEntries:(id)a3;
- (BOOL)dispatchStartScan:(id)a3 extendedPanIdToFind:(id)a4 borderAgentIdToFind:(id)a5;
- (BOOL)matchTheListWithServer:(id)a3;
- (BOOL)matchTheRecord:(id)a3;
- (NSArray)preferredList;
- (NSData)borderAgentIdToFind;
- (NSData)extendedPANIDToFind;
- (NSString)networkNameToFind;
- (OS_dispatch_queue)baFinderQueue;
- (OS_dispatch_semaphore)baFinderSemaphore;
- (THBorderAgentFinder)borderAgentFinder;
- (THPreferredThreadNetwork)preferredRecord;
- (id)dataFromHexString:(id)a3;
- (id)getAgentDescriptionForIndex:(unint64_t)a3;
- (id)getBorderAgentForIndex:(unint64_t)a3;
- (int64_t)findNWs;
- (void)agentChanged;
- (void)agentResolved:(id)a3;
- (void)clean;
- (void)clear;
- (void)setBaFinderQueue:(id)a3;
- (void)setBaFinderSemaphore:(id)a3;
- (void)setBorderAgentFinder:(id)a3;
- (void)setBorderAgentIdToFind:(id)a3;
- (void)setExtendedPANIDToFind:(id)a3;
- (void)setNetworkNameToFind:(id)a3;
- (void)setPreferredList:(id)a3;
- (void)setPreferredRecord:(id)a3;
- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5;
- (void)stopScan;
@end

@implementation ThreadBRFinder

- (BOOL)disPatchStartScanToMatchListOfPreferredNetworkEntries:(id)a3
{
  id v5 = a3;
  v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  baFinderSemaphore = self->_baFinderSemaphore;
  self->_baFinderSemaphore = v6;

  v8 = self->_baFinderSemaphore;
  if (v8)
  {
    objc_storeStrong((id *)&self->_preferredList, a3);
    preferredRecord = self->_preferredRecord;
    self->_preferredRecord = 0;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __72__ThreadBRFinder_disPatchStartScanToMatchListOfPreferredNetworkEntries___block_invoke;
    block[3] = &unk_100495628;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    NSLog(@"%s:%d: Failed to create semaphore, unexpected scenario", "-[ThreadBRFinder disPatchStartScanToMatchListOfPreferredNetworkEntries:]", 21);
  }

  return v8 != 0;
}

void __72__ThreadBRFinder_disPatchStartScanToMatchListOfPreferredNetworkEntries___block_invoke(uint64_t a1)
{
  id v5 = (id *)*(id *)(a1 + 32);
  uint64_t v2 = objc_opt_new();
  id v3 = v5[1];
  v5[1] = (id)v2;

  id v4 = v5[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [v5[1] start];
  }
}

- (BOOL)dispatchStartScan:(id)a3 extendedPanIdToFind:(id)a4 borderAgentIdToFind:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  baFinderSemaphore = self->_baFinderSemaphore;
  self->_baFinderSemaphore = v12;

  v14 = self->_baFinderSemaphore;
  if (v14)
  {
    preferredList = self->_preferredList;
    self->_preferredList = 0;

    preferredRecord = self->_preferredRecord;
    self->_preferredRecord = 0;

    objc_storeStrong((id *)&self->_extendedPANIDToFind, a4);
    objc_storeStrong((id *)&self->_networkNameToFind, a3);
    objc_storeStrong((id *)&self->_borderAgentIdToFind, a5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __76__ThreadBRFinder_dispatchStartScan_extendedPanIdToFind_borderAgentIdToFind___block_invoke;
    block[3] = &unk_100495628;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    NSLog(@"%s:%d: Failed to create semaphore, unexpected scenario", "-[ThreadBRFinder dispatchStartScan:extendedPanIdToFind:borderAgentIdToFind:]", 46);
  }

  return v14 != 0;
}

void __76__ThreadBRFinder_dispatchStartScan_extendedPanIdToFind_borderAgentIdToFind___block_invoke(uint64_t a1)
{
  id v5 = (id *)*(id *)(a1 + 32);
  uint64_t v2 = objc_opt_new();
  id v3 = v5[1];
  v5[1] = (id)v2;

  id v4 = v5[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [v5[1] start];
  }
}

- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__ThreadBRFinder_startScan_queue_timeInSec___block_invoke;
  block[3] = &unk_100495628;
  block[4] = self;
  v7 = a4;
  id v8 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  NSLog(@"Starting dispatch After");
  dispatch_time_t v9 = dispatch_time(0, 1000000000 * v5);
  dispatch_after(v9, v7, v8);
}

void __44__ThreadBRFinder_startScan_queue_timeInSec___block_invoke(uint64_t a1)
{
  unsigned int v5 = (id *)*(id *)(a1 + 32);
  uint64_t v2 = objc_opt_new();
  id v3 = v5[1];
  v5[1] = (id)v2;

  id v4 = v5[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [v5[1] start];
  }
}

- (void)stopScan
{
  borderAgentFinder = self->_borderAgentFinder;
  if (borderAgentFinder) {
    [(THBorderAgentFinder *)borderAgentFinder stop];
  }
}

- (void)clear
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __23__ThreadBRFinder_clear__block_invoke;
  block[3] = &unk_100495628;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __23__ThreadBRFinder_clear__block_invoke(uint64_t a1)
{
  v1 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)v1[1];
  v6 = v1;
  if (v2)
  {
    v1[1] = 0;

    v1 = v6;
  }
  id v3 = (void *)v1[8];
  if (v3)
  {
    v1[8] = 0;

    v1 = v6;
  }
  id v4 = (void *)v1[5];
  if (v4)
  {
    v1[5] = 0;

    v1 = v6;
  }
  unsigned int v5 = (void *)v1[6];
  if (v5)
  {
    v1[6] = 0;

    v1 = v6;
  }
}

- (void)clean
{
}

- (int64_t)findNWs
{
  int64_t result = (int64_t)self->_borderAgentFinder;
  if (result) {
    return (int64_t)[(id)result getNumberOfBorderAgents];
  }
  return result;
}

- (id)getBorderAgentForIndex:(unint64_t)a3
{
  borderAgentFinder = self->_borderAgentFinder;
  if (borderAgentFinder)
  {
    borderAgentFinder = [borderAgentFinder getBorderAgentAtIndex:a3];
  }

  return borderAgentFinder;
}

- (id)getAgentDescriptionForIndex:(unint64_t)a3
{
  borderAgentFinder = self->_borderAgentFinder;
  if (borderAgentFinder)
  {
    borderAgentFinder = [borderAgentFinder getAgentDescription:a3];
  }

  return borderAgentFinder;
}

- (void)agentChanged
{
}

- (BOOL)matchTheListWithServer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (!v4)
  {
    NSLog(@"Error:Empty Server");
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_81;
  }
  v6 = [v4 addresses];

  if (!v6)
  {
    v18 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheListWithServer:]();
    }

    goto LABEL_16;
  }
  v7 = [v5 TXTRecordData];
  id v8 = +[NSNetService dictionaryFromTXTRecordData:v7];

  if (!v8)
  {
    dispatch_time_t v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheListWithServer:]();
    }
    v19 = 0;
    v16 = 0;
    v20 = 0;
    BOOL v17 = 0;
    goto LABEL_80;
  }
  dispatch_time_t v9 = [v8 objectForKey:@"nn"];
  id v10 = [v8 objectForKey:@"xp"];
  id v11 = [v8 objectForKey:@"sb"];
  v12 = v11;
  if (!v9 || !v10 || !v11)
  {
    v21 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheListWithServer:].cold.8();
    }

    v64 = 0;
    id v65 = 0;
    v16 = 0;
    BOOL v17 = 0;
    goto LABEL_79;
  }
  unsigned int v70 = 0;
  v60 = v11;
  [v11 getBytes:&v70 length:4];
  unsigned int v13 = bswap32(v70);
  unsigned int v70 = v13;
  v14 = THCredentialsServerLogHandleForCategory(1);
  v15 = v14;
  if ((v13 & 0x10) == 0)
  {
    p_super = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheListWithServer:]();
    }
    v64 = 0;
    id v65 = 0;
    v16 = 0;
    BOOL v17 = 0;
LABEL_11:
    v12 = v60;
    goto LABEL_78;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v72 = "-[ThreadBRFinder matchTheListWithServer:]";
    __int16 v73 = 1024;
    int v74 = 234;
    __int16 v75 = 1024;
    LODWORD(v76) = v70;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s : %d: state bit map indicates thread n/w is UP :0x%x", buf, 0x18u);
  }

  v12 = v60;
  id v65 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
  if (!v65)
  {
    p_super = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheListWithServer:].cold.4();
    }
    v64 = 0;
    id v65 = 0;
    goto LABEL_73;
  }
  id v61 = [v10 length];
  if (v61 == (id)16)
  {
    v57 = v8;
    v58 = v5;
    v22 = THCredentialsServerLogHandleForCategory(1);
    v63 = v10;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v10 length];
      *(_DWORD *)buf = 136315650;
      v72 = "-[ThreadBRFinder matchTheListWithServer:]";
      __int16 v73 = 1024;
      int v74 = 247;
      __int16 v75 = 2048;
      id v76 = v23;
      v24 = "%s:%d XpanID is of OLD format (string based) with length : %lu";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v24, buf, 0x1Cu);
      goto LABEL_36;
    }
    goto LABEL_36;
  }
  id v25 = [v10 length];
  v26 = THCredentialsServerLogHandleForCategory(1);
  v22 = v26;
  if (v25 != (id)8)
  {
    p_super = v26;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheListWithServer:].cold.7(v10, p_super);
    }
    v64 = 0;
LABEL_73:
    v16 = 0;
    BOOL v17 = 0;
    goto LABEL_78;
  }
  v57 = v8;
  v58 = v5;
  v63 = v10;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v10 length];
    *(_DWORD *)buf = 136315650;
    v72 = "-[ThreadBRFinder matchTheListWithServer:]";
    __int16 v73 = 1024;
    int v74 = 251;
    __int16 v75 = 2048;
    id v76 = v27;
    v24 = "%s:%d XpanID is of NEW format (binary based) with length : %lu";
    goto LABEL_35;
  }
LABEL_36:
  id v28 = v65;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v29 = self->_preferredList;
  id v30 = [(NSArray *)v29 countByEnumeratingWithState:&v66 objects:v79 count:16];
  p_super = &v29->super;
  if (!v30)
  {
    v64 = 0;
    v16 = 0;
    BOOL v17 = 0;
    id v8 = v57;
    unsigned int v5 = v58;
    id v10 = v63;
    goto LABEL_78;
  }
  id v31 = v30;
  v59 = self;
  v56 = v9;
  v64 = 0;
  v16 = 0;
  uint64_t v32 = *(void *)v67;
LABEL_38:
  uint64_t v33 = 0;
  while (1)
  {
    if (*(void *)v67 != v32) {
      objc_enumerationMutation(v29);
    }
    v34 = *(void **)(*((void *)&v66 + 1) + 8 * v33);
    if (!v34) {
      goto LABEL_56;
    }
    v35 = [*(id *)(*((void *)&v66 + 1) + 8 * v33) network];
    v36 = [v35 networkName];
    unsigned int v37 = [v36 isEqualToString:v28];

    v38 = THCredentialsServerLogHandleForCategory(1);
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (!v37)
    {
      if (v39)
      {
        v51 = [v34 network];
        v52 = [v51 networkName];
        *(_DWORD *)buf = 136315906;
        v72 = "-[ThreadBRFinder matchTheListWithServer:]";
        __int16 v73 = 1024;
        int v74 = 300;
        __int16 v75 = 2112;
        id v76 = v52;
        __int16 v77 = 2112;
        id v78 = v65;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s : %d: Preferred Network to find :%@ does not match with mdns record :%@", buf, 0x26u);

        id v28 = v65;
        v29 = (NSArray *)p_super;
      }
      id v40 = v16;
      goto LABEL_53;
    }
    if (v39)
    {
      v49 = [v34 network];
      v50 = [v49 networkName];
      *(_DWORD *)buf = 136315906;
      v72 = "-[ThreadBRFinder matchTheListWithServer:]";
      __int16 v73 = 1024;
      int v74 = 267;
      __int16 v75 = 2112;
      id v76 = v50;
      __int16 v77 = 2112;
      id v78 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s : %d: Network name to find :%@ does match with mdns record name :%@", buf, 0x26u);
    }
    if (v61 != (id)16)
    {
      v46 = [v34 network];
      v47 = [v46 extendedPANID];
      unsigned int v48 = [v47 isEqualToData:v63];

      if (v48)
      {
        v54 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          id v10 = v63;
          -[ThreadBRFinder matchTheListWithServer:].cold.6(v34);
          uint64_t v42 = (uint64_t)v64;
        }
        else
        {
          id v10 = v63;
          uint64_t v42 = (uint64_t)v64;
        }
        id v40 = v16;
        id v8 = v57;
        unsigned int v5 = v58;
        dispatch_time_t v9 = v56;
        v41 = v59;
        v12 = v60;
        goto LABEL_77;
      }
      goto LABEL_55;
    }
    id v40 = [objc_alloc((Class)NSString) initWithData:v63 encoding:4];

    if (!v40)
    {
      v38 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v72 = "-[ThreadBRFinder matchTheListWithServer:]";
        __int16 v73 = 1024;
        int v74 = 274;
        __int16 v75 = 2112;
        id v76 = v58;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s : %d xpanid nsstring conversion failure, server : %@", buf, 0x1Cu);
      }
      id v40 = 0;
      goto LABEL_53;
    }
    v41 = v59;
    uint64_t v42 = [(ThreadBRFinder *)v59 dataFromHexString:v40];

    if (v42) {
      break;
    }
    v38 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v72 = "-[ThreadBRFinder matchTheListWithServer:]";
      __int16 v73 = 1024;
      int v74 = 280;
      __int16 v75 = 2112;
      id v76 = v58;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s : %d hex string conversion to nsdata failure for server : %@", buf, 0x1Cu);
    }
    v64 = 0;
LABEL_53:

    v16 = v40;
LABEL_56:
    if (v31 == (id)++v33)
    {
      id v53 = [(NSArray *)v29 countByEnumeratingWithState:&v66 objects:v79 count:16];
      id v31 = v53;
      if (!v53)
      {
        BOOL v17 = 0;
        id v8 = v57;
        unsigned int v5 = v58;
        dispatch_time_t v9 = v56;
        id v10 = v63;
        goto LABEL_11;
      }
      goto LABEL_38;
    }
  }
  v43 = [v34 network];
  v44 = [v43 extendedPANID];
  unsigned int v45 = [v44 isEqualToData:v42];

  if (!v45)
  {
    v64 = (void *)v42;
    v16 = v40;
LABEL_55:
    v29 = (NSArray *)p_super;
    id v28 = v65;
    goto LABEL_56;
  }
  v54 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    -[ThreadBRFinder matchTheListWithServer:].cold.5(v34);
  }
  id v8 = v57;
  unsigned int v5 = v58;
  dispatch_time_t v9 = v56;
  id v10 = v63;
  v12 = v60;
LABEL_77:

  objc_storeStrong((id *)&v41->_preferredRecord, v34);
  BOOL v17 = 1;
  v64 = (void *)v42;
  v16 = v40;
LABEL_78:

LABEL_79:
  v19 = v64;
  v20 = v65;
LABEL_80:

LABEL_81:
  return v17;
}

- (BOOL)matchTheRecord:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    v6 = [v4 addresses];

    if (v6)
    {
      v7 = [v5 TXTRecordData];
      id v8 = +[NSNetService dictionaryFromTXTRecordData:v7];

      if (!v8)
      {
        dispatch_time_t v9 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[ThreadBRFinder matchTheRecord:]();
        }
        LOBYTE(v15) = 0;
        goto LABEL_35;
      }
      dispatch_time_t v9 = [v8 objectForKey:@"nn"];
      id v10 = [v8 objectForKey:@"xp"];
      id v11 = [v8 objectForKey:@"xa"];
      v12 = [v8 objectForKey:@"sb"];
      unsigned int v13 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v54 = "-[ThreadBRFinder matchTheRecord:]";
        __int16 v55 = 1024;
        int v56 = 339;
        __int16 v57 = 2112;
        id v58 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s:%d BorderAgent MDNS Text Record Data : %@", buf, 0x1Cu);
      }

      preferredList = self->_preferredList;
      if (preferredList && [(NSArray *)preferredList count])
      {
        LOBYTE(v15) = [(ThreadBRFinder *)self matchTheListWithServer:v5];
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      p_networkNameToFind = (id *)&self->_networkNameToFind;
      if ((!self->_networkNameToFind || v9)
        && ((p_extendedPANIDToFind = (id *)&self->_extendedPANIDToFind, !self->_extendedPANIDToFind) || v10)
        && (!v11 ? (BOOL v19 = self->_borderAgentIdToFind == 0) : (BOOL v19 = 1), v19 && v12))
      {
        p_borderAgentIdToFind = &self->_borderAgentIdToFind;
        id v50 = [v10 length];
        if (v50 == (id)16)
        {
          v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [v10 length];
            *(_DWORD *)buf = 136315650;
            v54 = "-[ThreadBRFinder matchTheRecord:]";
            __int16 v55 = 1024;
            int v56 = 355;
            __int16 v57 = 2048;
            id v58 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu", buf, 0x1Cu);
          }
        }
        else
        {
          v46 = v12;
          id v24 = [v10 length];
          id v25 = THCredentialsServerLogHandleForCategory(1);
          v20 = v25;
          if (v24 != (id)8)
          {
            v12 = v46;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[ThreadBRFinder matchTheRecord:]4(v10, v11);
            }
            goto LABEL_93;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            id v26 = [v10 length];
            *(_DWORD *)buf = 136315650;
            v54 = "-[ThreadBRFinder matchTheRecord:]";
            __int16 v55 = 1024;
            int v56 = 359;
            __int16 v57 = 2048;
            id v58 = v26;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu", buf, 0x1Cu);
          }
          v12 = v46;
        }

        if (!*p_networkNameToFind)
        {
          v20 = 0;
          goto LABEL_47;
        }
        id v27 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
        if (v27)
        {
          v20 = v27;
          if (([*p_networkNameToFind isEqualToString:v27] & 1) == 0)
          {
            id v28 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[ThreadBRFinder matchTheRecord:]3();
            }
            goto LABEL_92;
          }
LABEL_47:
          id v29 = *p_extendedPANIDToFind;
          if (v50 == (id)16)
          {
            if (!v29)
            {
              v51 = 0;
              id v31 = 0;
LABEL_64:
              if (*p_borderAgentIdToFind)
              {
                id v35 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4];
                if (!v35)
                {
                  id v28 = v31;
                  uint64_t v33 = THCredentialsServerLogHandleForCategory(1);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                    -[ThreadBRFinder matchTheRecord:].cold.4();
                  }
                  goto LABEL_88;
                }
                v36 = v35;
                uint64_t v37 = [(ThreadBRFinder *)self dataFromHexString:v35];
                if (!v37)
                {
                  id v28 = v31;
                  v43 = THCredentialsServerLogHandleForCategory(1);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                    -[ThreadBRFinder matchTheRecord:].cold.5();
                  }

                  goto LABEL_92;
                }
                v34 = (void *)v37;
                v47 = v31;
                if (![(NSData *)*p_borderAgentIdToFind isEqualToData:v37])
                {
                  v44 = THCredentialsServerLogHandleForCategory(1);
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                    -[ThreadBRFinder matchTheRecord:].cold.6();
                  }

                  goto LABEL_93;
                }
                unsigned int v45 = v36;
                v49 = v20;
              }
              else
              {
                v47 = v31;
                v49 = v20;
                v34 = 0;
                unsigned int v45 = 0;
              }
LABEL_77:
              unsigned int v52 = 0;
              [v12 getBytes:&v52 length:4];
              unsigned int v39 = bswap32(v52);
              unsigned int v52 = v39;
              BOOL v15 = (v39 >> 4) & 1;
              id v40 = THCredentialsServerLogHandleForCategory(1);
              v41 = v40;
              if ((v39 & 0x10) != 0)
              {
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v54 = "-[ThreadBRFinder matchTheRecord:]";
                  __int16 v55 = 1024;
                  int v56 = 444;
                  __int16 v57 = 1024;
                  LODWORD(v58) = v52;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s : %d: state bit map indicates thread n/w is UP :0x%x", buf, 0x18u);
                }
              }
              else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                -[ThreadBRFinder matchTheRecord:]();
              }

              goto LABEL_34;
            }
            id v30 = [objc_alloc((Class)NSString) initWithData:v10 encoding:4];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = [(ThreadBRFinder *)self dataFromHexString:v30];
              if (!v32)
              {
                id v28 = v31;
                uint64_t v42 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                  -[ThreadBRFinder matchTheRecord:].cold.8();
                }

                goto LABEL_92;
              }
              v51 = (void *)v32;
              if ((objc_msgSend(*p_extendedPANIDToFind, "isEqualToData:") & 1) == 0)
              {
                id v28 = v31;
                uint64_t v33 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                  -[ThreadBRFinder matchTheRecord:].cold.9();
                }
LABEL_88:

LABEL_92:
                goto LABEL_93;
              }
              goto LABEL_64;
            }
            v38 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[ThreadBRFinder matchTheRecord:].cold.7();
            }
          }
          else if (v29 && ([v29 isEqualToData:v10] & 1) == 0)
          {
            v38 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[ThreadBRFinder matchTheRecord:]1();
            }
          }
          else
          {
            if (!*p_borderAgentIdToFind || [(NSData *)*p_borderAgentIdToFind isEqualToData:v11])
            {
              v49 = v20;
              v51 = 0;
              v34 = 0;
              unsigned int v45 = 0;
              v47 = 0;
              goto LABEL_77;
            }
            v38 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[ThreadBRFinder matchTheRecord:]0();
            }
          }

LABEL_93:
          goto LABEL_33;
        }
        v22 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[ThreadBRFinder matchTheRecord:]2();
        }
      }
      else
      {
        v22 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[ThreadBRFinder matchTheRecord:]5();
        }
      }

LABEL_33:
      LOBYTE(v15) = 0;
      goto LABEL_34;
    }
    v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ThreadBRFinder matchTheRecord:]();
    }
  }
  else
  {
    NSLog(@"Error:Empty Server");
  }
  LOBYTE(v15) = 0;
LABEL_36:

  return v15;
}

- (void)agentResolved:(id)a3
{
  id v5 = a3;
  NSLog(@"Agent Resolved");
  if (v5)
  {
    if (self->_baFinderSemaphore)
    {
      if ([(ThreadBRFinder *)self matchTheRecord:v5])
      {
        id v4 = [(ThreadBRFinder *)self baFinderSemaphore];
        dispatch_semaphore_signal(v4);
      }
    }
    else
    {
      NSLog(@"%s:%d: Returning no semaphore initialized, Agent Resolved : %@", "-[ThreadBRFinder agentResolved:]", 461, v5);
    }
  }
  else
  {
    NSLog(@"Agent Resolved, server is nil");
  }
}

- (id)dataFromHexString:(id)a3
{
  id v3 = [a3 lowercaseString];
  id v4 = objc_opt_new();
  __int16 v12 = 0;
  int v5 = [v3 length];
  if (v5 >= 2)
  {
    int v6 = 0;
    int v7 = v5 - 1;
    do
    {
      int v8 = v6 + 1;
      unsigned __int8 v9 = [v3 characterAtIndex:v6];
      if ((char)v9 >= 48 && v9 <= 0x66u && v9 - 58 >= 0x27)
      {
        __str[0] = v9;
        __str[1] = [v3 characterAtIndex:v8];
        HIBYTE(v12) = strtol(__str, 0, 16);
        [v4 appendBytes:(char *)&v12 + 1 length:1];
        int v8 = v6 + 2;
      }
      int v6 = v8;
    }
    while (v8 < v7);
  }

  return v4;
}

- (THBorderAgentFinder)borderAgentFinder
{
  return (THBorderAgentFinder *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBorderAgentFinder:(id)a3
{
}

- (NSString)networkNameToFind
{
  return self->_networkNameToFind;
}

- (void)setNetworkNameToFind:(id)a3
{
}

- (NSData)extendedPANIDToFind
{
  return self->_extendedPANIDToFind;
}

- (void)setExtendedPANIDToFind:(id)a3
{
}

- (NSData)borderAgentIdToFind
{
  return self->_borderAgentIdToFind;
}

- (void)setBorderAgentIdToFind:(id)a3
{
}

- (NSArray)preferredList
{
  return self->_preferredList;
}

- (void)setPreferredList:(id)a3
{
}

- (THPreferredThreadNetwork)preferredRecord
{
  return self->_preferredRecord;
}

- (void)setPreferredRecord:(id)a3
{
}

- (OS_dispatch_semaphore)baFinderSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBaFinderSemaphore:(id)a3
{
}

- (OS_dispatch_queue)baFinderQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBaFinderQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baFinderQueue, 0);
  objc_storeStrong((id *)&self->_baFinderSemaphore, 0);
  objc_storeStrong((id *)&self->_preferredRecord, 0);
  objc_storeStrong((id *)&self->_preferredList, 0);
  objc_storeStrong((id *)&self->_borderAgentIdToFind, 0);
  objc_storeStrong((id *)&self->_extendedPANIDToFind, 0);
  objc_storeStrong((id *)&self->_networkNameToFind, 0);

  objc_storeStrong((id *)&self->_borderAgentFinder, 0);
}

- (void)matchTheListWithServer:.cold.1()
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_18_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s : No IP address is available for the server : %@, continue to next BR", (uint8_t *)v1, 0x16u);
}

- (void)matchTheListWithServer:.cold.2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d No text record data available for the server : %@, continue to next network, retry flag is on!", v2, v3, v4, v5, 2u);
}

- (void)matchTheListWithServer:.cold.3()
{
  *(_DWORD *)uint64_t v3 = 136315650;
  OUTLINED_FUNCTION_5_3();
  *(_DWORD *)&v3[7] = 236;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s : %d: state bit map indicates thread n/w is DOWN :0x%x", (uint8_t *)v3, 0x18u);
}

- (void)matchTheListWithServer:.cold.4()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)matchTheListWithServer:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_2((void *)&_mh_execute_header, v3, v4, "%s : %d: Old format Xpanid to find :%@ does match with mdns record xpanid :%@", v5, v6, v7, v8, 2u);
}

- (void)matchTheListWithServer:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_2((void *)&_mh_execute_header, v3, v4, "%s : %d: New format Xpanid to find :%@ does match with mdns record xpanid :%@", v5, v6, v7, v8, 2u);
}

- (void)matchTheListWithServer:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  [a1 length];
  *(_DWORD *)uint64_t v4 = 136315650;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)&v4[7] = 255;
  v4[9] = 2048;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:%d Continuing... XpanID length mismatch !!! xpan id length : %lu", (uint8_t *)v4, 0x1Cu);
}

- (void)matchTheListWithServer:.cold.8()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d can not parse dictionary data for server : %@", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.1()
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_18_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s : No IP address is available for the server : %@, continue to next BR", (uint8_t *)v1, 0x16u);
}

- (void)matchTheRecord:.cold.2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d No text record data available for the server : %@, continue to next network, retry flag is on!", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.3()
{
  *(_DWORD *)uint64_t v3 = 136315650;
  OUTLINED_FUNCTION_5_3();
  *(_DWORD *)&v3[7] = 446;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s : %d: state bit map indicates thread n/w is DOWN :0x%x", (uint8_t *)v3, 0x18u);
}

- (void)matchTheRecord:.cold.4()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d xpanid and baid nsstring conversion failure, server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.5()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d hex string conversion to nsdata failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.6()
{
  OUTLINED_FUNCTION_8_0(__stack_chk_guard);
  int v2 = 136315906;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_3((void *)&_mh_execute_header, v0, v1, "%s : %d: BaID to find :%@ does not match with mdns record BaID :%@", v2);
}

- (void)matchTheRecord:.cold.7()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d xpanid nsstring conversion failure, server : %@", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.8()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d hex string conversion to nsdata failure for server : %@", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.9()
{
  OUTLINED_FUNCTION_8_0(__stack_chk_guard);
  int v2 = 136315906;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_3((void *)&_mh_execute_header, v0, v1, "%s : %d: Xpanid to find :%@ does not match with mdns record xpanid :%@", v2);
}

- (void)matchTheRecord:.cold.10()
{
  OUTLINED_FUNCTION_8_0(__stack_chk_guard);
  int v2 = 136315906;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_3((void *)&_mh_execute_header, v0, v1, "%s : %d: BaID to find :%@ does not match with mdns record BaID :%@", v2);
}

- (void)matchTheRecord:.cold.11()
{
  OUTLINED_FUNCTION_8_0(__stack_chk_guard);
  int v2 = 136315906;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_3((void *)&_mh_execute_header, v0, v1, "%s : %d: Xpanid to find :%@ does not match with mdns record xpanid :%@", v2);
}

- (void)matchTheRecord:.cold.12()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)matchTheRecord:.cold.13()
{
  OUTLINED_FUNCTION_8_0(__stack_chk_guard);
  int v2 = 136315906;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_3((void *)&_mh_execute_header, v0, v1, "%s : %d: Network to find :%@ does not match with mdns record :%@", v2);
}

- (void)matchTheRecord:(void *)a1 .cold.14(void *a1, void *a2)
{
  [a1 length];
  [a2 length];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_2((void *)&_mh_execute_header, v3, v4, "%s:%d Continuing... BorderAgent ID and XpanID length mismatch !!! xpan id length : %lu, border agent id length : %lu", v5, v6, v7, v8, 2u);
}

- (void)matchTheRecord:.cold.15()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d can not parse dictionary data for server : %@", v2, v3, v4, v5, 2u);
}

@end