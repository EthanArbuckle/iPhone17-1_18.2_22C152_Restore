@interface ThreadNetworkfinder
- (THBorderAgentFinder)borderAgentFinder;
- (id)getAgentDescriptionForIndex:(unint64_t)a3;
- (id)getBorderAgentForIndex:(unint64_t)a3;
- (int64_t)findNWs;
- (void)agentChanged;
- (void)agentResolved:(id)a3;
- (void)clear;
- (void)printServer:(id)a3;
- (void)setBorderAgentFinder:(id)a3;
- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5;
- (void)stopScan;
@end

@implementation ThreadNetworkfinder

- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__ThreadNetworkfinder_startScan_queue_timeInSec___block_invoke;
  block[3] = &unk_10049C208;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v10 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting dispatch After", v12, 2u);
  }

  dispatch_time_t v11 = dispatch_time(0, 1000000000 * v5);
  dispatch_after(v11, v9, v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__ThreadNetworkfinder_startScan_queue_timeInSec___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = objc_opt_new();
  id v3 = WeakRetained[1];
  WeakRetained[1] = (id)v2;

  id v4 = WeakRetained[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [WeakRetained[1] start];
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
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __28__ThreadNetworkfinder_clear__block_invoke;
  v2[3] = &unk_10049C230;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __28__ThreadNetworkfinder_clear__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)WeakRetained[1];
  if (v2)
  {
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
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
  uint64_t v2 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Agent Changed", v3, 2u);
  }
}

- (void)printServer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 addresses];

  if (v4)
  {
    unsigned int v5 = [v3 TXTRecordData];
    v6 = +[NSNetService dictionaryFromTXTRecordData:v5];

    if (!v6)
    {
      v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkfinder printServer:]();
      }
      goto LABEL_41;
    }
    v7 = [v6 objectForKey:@"nn"];
    id v8 = [v6 objectForKey:@"xp"];
    v9 = [v6 objectForKey:@"xa"];
    v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315650;
      v21 = "-[ThreadNetworkfinder printServer:]";
      __int16 v22 = 1024;
      int v23 = 104;
      __int16 v24 = 2112;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d BorderAgent MDNS Text Record Data : %@", (uint8_t *)&v20, 0x1Cu);
    }

    if (!v7 || !v8 || !v9)
    {
      id v14 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkfinder printServer:].cold.6();
      }
      goto LABEL_40;
    }
    if (-[NSObject length](v8, "length") == (id)16 && [v9 length] == (id)16)
    {
      dispatch_time_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v8 length];
        int v20 = 136315650;
        v21 = "-[ThreadNetworkfinder printServer:]";
        __int16 v22 = 1024;
        int v23 = 112;
        __int16 v24 = 2048;
        v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu", (uint8_t *)&v20, 0x1Cu);
      }
      char v13 = 0;
    }
    else
    {
      if (-[NSObject length](v8, "length") != (id)8 || [v9 length] != (id)8)
      {
        id v14 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkfinder printServer:].cold.5((uint8_t *)&v20, (uint64_t)-[NSObject length](v8, "length"), (uint64_t)[v9 length], v14);
        }
        goto LABEL_40;
      }
      dispatch_time_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      char v13 = 1;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v15 = [v8 length];
        int v20 = 136315650;
        v21 = "-[ThreadNetworkfinder printServer:]";
        __int16 v22 = 1024;
        int v23 = 116;
        __int16 v24 = 2048;
        v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu", (uint8_t *)&v20, 0x1Cu);
      }
    }

    id v14 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    if (v14)
    {
      if (v13)
      {
        v16 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v20 = 136316162;
          v21 = "-[ThreadNetworkfinder printServer:]";
          __int16 v22 = 1024;
          int v23 = 144;
          __int16 v24 = 2112;
          v25 = v14;
          __int16 v26 = 2112;
          v27 = v8;
          __int16 v28 = 2112;
          v29 = v9;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d: mdns (network name:%@, xpanid:%@, baid : %@)", (uint8_t *)&v20, 0x30u);
        }
      }
      else
      {
        v16 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
        id v17 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
        v18 = v17;
        if (v16 && v17)
        {
          v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v20 = 136316162;
            v21 = "-[ThreadNetworkfinder printServer:]";
            __int16 v22 = 1024;
            int v23 = 140;
            __int16 v24 = 2112;
            v25 = v14;
            __int16 v26 = 2112;
            v27 = v16;
            __int16 v28 = 2112;
            v29 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s:%d: network name str : %@, xpan id str : %@, baid str : %@", (uint8_t *)&v20, 0x30u);
          }
        }
        else
        {
          v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkfinder printServer:].cold.4();
          }
        }
      }
    }
    else
    {
      v16 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkfinder printServer:]();
      }
    }

LABEL_40:
LABEL_41:

    goto LABEL_42;
  }
  v6 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkfinder printServer:]((uint64_t)v3, v6);
  }
LABEL_42:
}

- (void)agentResolved:(id)a3
{
  id v4 = a3;
  unsigned int v5 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Agent Resolved ! Server : %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    [(ThreadNetworkfinder *)self printServer:v4];
  }
  else
  {
    v6 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkfinder agentResolved:](v6);
    }
  }
}

- (THBorderAgentFinder)borderAgentFinder
{
  return (THBorderAgentFinder *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBorderAgentFinder:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)printServer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[ThreadNetworkfinder printServer:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s : No IP address is available for the server : %@, continue to next BR", (uint8_t *)&v2, 0x16u);
}

- (void)printServer:.cold.2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d No text record data available for the server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)printServer:.cold.3()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)printServer:.cold.4()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d xpanid and baid nsstring conversion failure, server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)printServer:(uint64_t)a3 .cold.5(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = "-[ThreadNetworkfinder printServer:]";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 120;
  *((_WORD *)buf + 9) = 2048;
  *(void *)(buf + 20) = a2;
  *((_WORD *)buf + 14) = 2048;
  *(void *)(buf + 30) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:%d Continuing... BorderAgent ID and XpanID length mismatch !!! xpan id length : %lu, border agent id length : %lu", buf, 0x26u);
}

- (void)printServer:.cold.6()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d cannot parse dictionary data for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

- (void)agentResolved:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Agent Resolved ! Server is nil", v1, 2u);
}

@end