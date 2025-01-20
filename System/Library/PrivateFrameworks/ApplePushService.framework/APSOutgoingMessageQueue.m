@interface APSOutgoingMessageQueue
- (APSOutgoingMessageQueue)initWithDelegate:(id)a3 environment:(id)a4;
- (BOOL)_outgoingMessageIsLateCriticalMessage:(id)a3;
- (BOOL)hasEagerMessages;
- (BOOL)hasPendingMessages;
- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled;
- (BOOL)shouldReportLastReversePushRTTOnInterface:(id)a3;
- (id)lastReversePushRTTMillisecondsOnInterface:(id)a3;
- (id)outgoingMessagesToSend;
- (unint64_t)count;
- (void)_clearCriticalMessageKeepAliveTimer;
- (void)_clearCriticalMessageKeepAliveTimerIfAppropriate;
- (void)_criticalMessageKeepAliveTimerFired;
- (void)_deliverResult:(id)a3 forMessage:(id)a4;
- (void)_queueChanged;
- (void)_recalculateDisableFastDormancy;
- (void)_recalculatePowerAssertion;
- (void)_recalculateTimer;
- (void)_startCriticalMessageFlushTimerSendingFlush;
- (void)_timerFired:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)cancelOutgoingMessageWithID:(unint64_t)a3;
- (void)dealloc;
- (void)enqueueOutgoingMessage:(id)a3 forOriginator:(id)a4;
- (void)handleAcknowledgmentForOutgoingMessageWithResult:(id)a3 ackTimestamp:(unint64_t)a4 linkQuality:(int)a5 connectionType:(int64_t)a6 onInterface:(id)a7;
- (void)handleConnectionClosedOnInterface:(id)a3;
- (void)handleConnectionOpenedOnInterface:(id)a3;
- (void)handleErrorSendingOutgoingMessage:(id)a3 error:(id)a4;
- (void)handleSentOutgoingMessage:(id)a3 onInterface:(id)a4;
- (void)setCriticalMessageKeepAliveTimerDuration:(id)a3;
- (void)setCriticalMessageTimeout:(id)a3;
- (void)setForcedShortTimeoutInterval:(id)a3;
- (void)setNumberOfCriticalMessageFlushesBeforeDisconnecting:(id)a3;
- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3;
- (void)setShouldReportLastReversePushRTT:(BOOL)a3 onInterface:(id)a4;
- (void)transferOwnershipOfPendingMessagesToHandler:(id)a3;
@end

@implementation APSOutgoingMessageQueue

- (APSOutgoingMessageQueue)initWithDelegate:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APSOutgoingMessageQueue;
  v9 = [(APSOutgoingMessageQueue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
    v10->_criticalMessageTimeout = 10.0;
    v10->_criticalMessageKeepAliveTimerDuration = 10.0;
    *(_OWORD *)&v10->_criticalMessageFlushCount = xmmword_10010EB40;
    v10->_criticalMessageFlushSize = 0;
    v10->_forcedShortTimeoutDuration = 2.0;
  }

  return v10;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSTimer *)v2->_timer invalidate];
  objc_sync_exit(v2);

  [(APSOutgoingMessageQueue *)v2 _clearCriticalMessageKeepAliveTimer];
  v2->_criticalMessageFlushCount = 0;
  v2->_criticalMessageFlushSize = 0;
  v3.receiver = v2;
  v3.super_class = (Class)APSOutgoingMessageQueue;
  [(APSOutgoingMessageQueue *)&v3 dealloc];
}

- (void)enqueueOutgoingMessage:(id)a3 forOriginator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[(NSMutableArray *)self->_queue count] > 0x63)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000C9E38((uint64_t)self, v6);
    }
    objc_super v12 = APSError();
    [v7 handleResult:v12 forSendingOutgoingMessage:v6];
  }
  else
  {
    queue = self->_queue;
    if (!queue)
    {
      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v10 = self->_queue;
      self->_queue = v9;

      queue = self->_queue;
    }
    [(NSMutableArray *)queue addObject:v6];
    ++self->_numberQueued;
    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastNotificationQueued = v11;
    [(APSOutgoingMessageQueue *)self _queueChanged];
  }
}

- (id)outgoingMessagesToSend
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_queue;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "wasSent", (void)v11) & 1) == 0
          && ([v9 wasCancelled] & 1) == 0
          && ([v9 hasTimedOut] & 1) == 0)
        {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)cancelOutgoingMessageWithID:(unint64_t)a3
{
  id v5 = [(NSMutableArray *)self->_queue count];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->_queue objectAtIndex:v7];
      if ([v8 messageID] == (id)a3) {
        break;
      }

      if (v6 == (id)++v7) {
        goto LABEL_5;
      }
    }
    if (([v8 wasCancelled] & 1) != 0 || objc_msgSend(v8, "hasTimedOut"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        long long v13 = self;
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Cancelled outgoing message %lu was already cancelled or timed out", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      v9 = APSError();
      [(APSOutgoingMessageQueue *)self _deliverResult:v9 forMessage:v8];
    }
    unsigned int v10 = [v8 wasSent];
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        int v12 = 138412546;
        long long v13 = self;
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Cancelled outgoing message %lu was already sent", (uint8_t *)&v12, 0x16u);
      }
      [v8 setCancelled:1];
    }
    else
    {
      if (v11)
      {
        int v12 = 138412546;
        long long v13 = self;
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Removing cancelled outgoing message %lu from queue", (uint8_t *)&v12, 0x16u);
      }
      [(NSMutableArray *)self->_queue removeObjectAtIndex:v7];
    }
  }
  else
  {
LABEL_5:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      long long v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Cancelled outgoing message %lu not found in queue", (uint8_t *)&v12, 0x16u);
    }
  }
  [(APSOutgoingMessageQueue *)self _queueChanged];
}

- (void)transferOwnershipOfPendingMessagesToHandler:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_queue;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          BOOL v11 = objc_msgSend(v10, "originator", (void)v13);
          v4[2](v4, v10, v11);
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    queue = self->_queue;
    self->_queue = 0;

    [(APSOutgoingMessageQueue *)self _queueChanged];
  }
}

- (void)handleSentOutgoingMessage:(id)a3 onInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    BOOL v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    id v17 = [v6 identifier];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ handleSentOutgoingMessage: %@ onInterface %@ identifier %lu", buf, 0x2Au);
  }
  if ([v6 wasSent] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000C9ED8((uint64_t)self);
  }
  [v6 setSent:1];
  uint64_t v8 = +[NSDate date];
  [v6 setSentTimestamp:v8];

  [v6 setSendInterfaceIdentifier:v7];
  id v9 = [v6 messageID];
  APSAlert();
  [(APSOutgoingMessageQueue *)self _queueChanged];
}

- (void)handleErrorSendingOutgoingMessage:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [a3 messageID];
  id v8 = [(NSMutableArray *)self->_queue count];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = 0;
    *(void *)&long long v9 = 138412546;
    long long v14 = v9;
    while (1)
    {
      __int16 v12 = -[NSMutableArray objectAtIndex:](self->_queue, "objectAtIndex:", v11, v14);
      if ([v12 messageID] == v7 && !objc_msgSend(v12, "wasSent")) {
        break;
      }
      if ([v12 messageID] == v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v14;
        __int16 v16 = self;
        __int16 v17 = 2048;
        id v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Message %lu may have already been sent, not removing message...", buf, 0x16u);
      }

      if (v10 == (id)++v11) {
        goto LABEL_9;
      }
    }
    id v13 = [v12 originator];
    [v13 handleResult:v6 forSendingOutgoingMessage:v12];
    [(NSMutableArray *)self->_queue removeObjectAtIndex:v11];
  }
  else
  {
LABEL_9:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000C9F88((uint64_t)self, (uint64_t)v7);
    }
  }
  [(APSOutgoingMessageQueue *)self _queueChanged];
}

- (BOOL)shouldReportLastReversePushRTTOnInterface:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    long long v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to return shouldReportLastReversePushRTT on invalid interface %@", (uint8_t *)&v8, 0x16u);
  }
  id v5 = [(NSMutableDictionary *)self->_shouldReportLastReversePushRTT objectForKeyedSubscript:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)setShouldReportLastReversePushRTT:(BOOL)a3 onInterface:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_shouldReportLastReversePushRTT objectForKeyedSubscript:v6];
    unsigned int v8 = [v7 BOOLValue];

    if (v8 != v4)
    {
      long long v9 = +[NSNumber numberWithBool:v4];
      [(NSMutableDictionary *)self->_shouldReportLastReversePushRTT setObject:v9 forKeyedSubscript:v6];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = @"NO";
        *(_DWORD *)__int16 v12 = 138412802;
        *(void *)&v12[4] = self;
        *(_WORD *)&v12[12] = 2112;
        if (v4) {
          CFStringRef v10 = @"YES";
        }
        *(void *)&v12[14] = v10;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to set shouldReportLastReversePushRTT to %@ on  %@", v12, 0x20u);
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastReversePushRTTMilliseconds, "setObject:forKeyedSubscript:", 0, v6, *(_OWORD *)v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    *(_DWORD *)__int16 v12 = 138412802;
    *(void *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2112;
    if (v4) {
      CFStringRef v11 = @"YES";
    }
    *(void *)&v12[14] = v11;
    __int16 v13 = 2112;
    id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to set shouldReportLastReversePushRTT %@ on invalid interface %@", v12, 0x20u);
  }
}

- (id)lastReversePushRTTMillisecondsOnInterface:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      CFStringRef v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get  _lastReversePushRTTMilliseconds on invalid interface %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_8;
  }
  id v5 = [(NSMutableDictionary *)self->_shouldReportLastReversePushRTT objectForKeyedSubscript:v4];

  if (!v5)
  {
LABEL_8:
    id v7 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableDictionary *)self->_lastReversePushRTTMilliseconds objectForKeyedSubscript:v4];
    int v9 = 138412802;
    CFStringRef v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get  _lastReversePushRTTMilliseconds %@ on interface %@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [(NSMutableDictionary *)self->_lastReversePushRTTMilliseconds objectForKeyedSubscript:v4];
LABEL_9:

  return v7;
}

- (void)handleAcknowledgmentForOutgoingMessageWithResult:(id)a3 ackTimestamp:(unint64_t)a4 linkQuality:(int)a5 connectionType:(int64_t)a6 onInterface:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v10 = a3;
  id v11 = a7;
  p_queue = &self->_queue;
  id v13 = [(NSMutableArray *)self->_queue count];
  if (v13)
  {
    id v14 = v13;
    id v15 = v10;
    uint64_t v16 = 0;
    while (1)
    {
      __int16 v17 = [(NSMutableArray *)*p_queue objectAtIndex:v16];
      id v18 = [v17 sendInterfaceIdentifier];
      unsigned __int8 v19 = [v18 isEqualToString:v11];

      if (v19) {
        break;
      }
      if (v14 == (id)++v16)
      {
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
    id v10 = v15;
  }
  else
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v58 = self;
    __int16 v59 = 2048;
    double v60 = *(double *)&v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ handleAcknowledgmentForOutgoingMessageWithResult - firstSentIndex %lu", buf, 0x16u);
  }
  if (v16 != 0x7FFFFFFFFFFFFFFFLL
    && [(NSMutableArray *)*p_queue count]
    && ([(NSMutableArray *)*p_queue objectAtIndex:v16],
        v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 wasSent],
        v20,
        v21))
  {
    v53 = v10;
    +[NSDate timeIntervalSinceReferenceDate];
    self->_double lastReceivedAckOrReconnect = v22;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double lastReceivedAckOrReconnect = self->_lastReceivedAckOrReconnect;
      *(_DWORD *)buf = 138412546;
      v58 = self;
      __int16 v59 = 2048;
      double v60 = lastReceivedAckOrReconnect;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ updating lastReceivedAck to %f", buf, 0x16u);
    }
    v24 = [(NSMutableArray *)self->_queue objectAtIndex:v16];
    id v49 = [v24 messageID];
    APSAlert();
    uint64_t v25 = objc_msgSend(v24, "sentTimestamp", v49);
    v26 = +[NSDate date];
    v52 = (void *)v25;
    [v26 timeIntervalSinceDate:v25];
    double v28 = v27;

    v29 = +[NSNumber numberWithDouble:v28];
    uint64_t v30 = +[NSNumber numberWithInt:v8];
    uint64_t v31 = +[NSNumber numberWithUnsignedInteger:self->_criticalMessageFlushCount];
    uint64_t v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 payloadLength]);
    v67[0] = @"ConnectionType";
    v33 = sub_100006494(a6);
    v68[0] = v33;
    v68[1] = v30;
    v55 = (void *)v30;
    v67[1] = @"LinkQuality";
    v67[2] = @"FlushCount";
    v50 = (void *)v32;
    v51 = (void *)v31;
    v68[2] = v31;
    v68[3] = v29;
    v67[3] = @"SendDuration";
    v67[4] = @"PayloadSize";
    v68[4] = v32;
    v67[5] = @"MessageIdentifier";
    v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 identifier]);
    v68[5] = v34;
    v67[6] = @"Topic";
    v35 = [v24 topic];
    v68[6] = v35;
    v36 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:7];

    v37 = v29;
    [v29 doubleValue];
    v39 = +[NSNumber numberWithUnsignedInteger:(unint64_t)(v38 * 1000.0)];
    [(NSMutableDictionary *)self->_lastReversePushRTTMilliseconds setObject:v39 forKeyedSubscript:v11];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [(NSMutableDictionary *)self->_lastReversePushRTTMilliseconds objectForKeyedSubscript:v11];
      *(_DWORD *)buf = 138412802;
      v58 = self;
      __int16 v59 = 2112;
      double v60 = *(double *)&v40;
      __int16 v61 = 2112;
      id v62 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ record _lastReversePushRTTMilliseconds %@ on %@", buf, 0x20u);
    }
    v41 = [(NSMutableDictionary *)self->_lastReversePushRTTMilliseconds objectForKeyedSubscript:v11];
    objc_msgSend(v24, "setSendRTT:", objc_msgSend(v41, "unsignedIntegerValue"));

    [v24 setAckReceived:1];
    [v24 setAckTimestamp:a4];
    id v10 = v53;
    if (([v24 wasCancelled] & 1) != 0 || objc_msgSend(v24, "hasTimedOut"))
    {
      v42 = &objc_retain_x28_ptr;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [v24 messageID];
        *(_DWORD *)buf = 138412546;
        v58 = self;
        __int16 v59 = 2048;
        double v60 = *(double *)&v43;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Ack'ed outgoing message %lu was already cancelled or timed out", buf, 0x16u);
      }
      APSPowerLog();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = [v24 messageID];
        id v45 = [v24 identifier];
        id v46 = [v53 code];
        v47 = [v53 localizedDescription];
        *(_DWORD *)buf = 138413314;
        v58 = self;
        __int16 v59 = 2048;
        double v60 = *(double *)&v44;
        __int16 v61 = 2048;
        id v62 = v45;
        __int16 v63 = 2048;
        id v64 = v46;
        id v10 = v53;
        __int16 v65 = 2112;
        v66 = v47;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Delivering result for outgoing message %lu with idenitifer %lu: %ld '%@'", buf, 0x34u);
      }
      APSPowerLog();
      [(APSOutgoingMessageQueue *)self _deliverResult:v10 forMessage:v24];
      v42 = &objc_retain_x28_ptr;
    }
    [(NSMutableArray *)self->_queue removeObjectAtIndex:v16];
    ++self->_numberAcked;
    [v42[162] timeIntervalSinceReferenceDate];
    self->_lastNotificationAcked = v48;
    [(APSOutgoingMessageQueue *)self _queueChanged];
  }
  else if ([(NSMutableArray *)*p_queue count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000CA094((uint64_t)self, (id *)&self->_queue);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1000CA014((uint64_t)self);
  }
}

- (void)handleConnectionOpenedOnInterface:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  self->_double lastReceivedAckOrReconnect = v5;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_queue;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138412546;
    long long v20 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v13, "wasCancelled", v20, (void)v21) & 1) == 0
          && ([v13 hasTimedOut] & 1) == 0)
        {
          if ([v13 isCritical])
          {
            id v14 = [v13 timestamp];
            [v14 timeIntervalSinceNow];
            double v16 = v15 + self->_criticalMessageTimeout;

            if (v16 < 0.0 && ([v13 sendRetried] & 1) == 0)
            {
              __int16 v17 = [v13 sendInterfaceIdentifier];
              unsigned __int8 v18 = [v17 isEqualToString:v4];

              if ((v18 & 1) == 0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned __int8 v19 = [v13 guid];
                  *(_DWORD *)buf = v20;
                  v26 = self;
                  __int16 v27 = 2112;
                  double v28 = v19;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ informed of reconnect, retry late critical message %@ sent on another interface", buf, 0x16u);
                }
                [v13 setSent:0];
                [v13 setSendRetried:1];
                [v13 setSendInterfaceIdentifier:0];
                [v6 addObject:v13];
              }
            }
          }
        }
      }
      id v10 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_queue removeObjectsInArray:v6];
  [(NSMutableArray *)self->_queue addObjectsFromArray:v6];
}

- (void)handleConnectionClosedOnInterface:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v6 = (uint64_t)[(NSMutableArray *)self->_queue count];
  if (v6 >= 1)
  {
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    *(void *)&long long v7 = 138412802;
    long long v16 = v7;
    do
    {
      id v10 = -[NSMutableArray objectAtIndex:](self->_queue, "objectAtIndex:", v9, v16);
      uint64_t v11 = [v10 sendInterfaceIdentifier];
      unsigned int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        if (([v10 wasCancelled] & 1) != 0
          || [v10 hasTimedOut])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [v10 messageID];
            *(_DWORD *)buf = 138412546;
            unsigned __int8 v18 = self;
            __int16 v19 = 2048;
            id v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Removing cancelled or timed out outgoing message %lu from queue", buf, 0x16u);
          }
LABEL_12:
          [(NSMutableArray *)self->_queue removeObjectAtIndex:v9--];
          --v8;
          goto LABEL_13;
        }
        if ([v10 wasSent])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v10 messageID];
            *(_DWORD *)buf = v16;
            unsigned __int8 v18 = self;
            __int16 v19 = 2048;
            id v20 = v14;
            __int16 v21 = 2112;
            id v22 = v4;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Clearing sent flag for outgoing message %lu that had been sent on %@", buf, 0x20u);
          }
          [v10 setSent:0];
          [v10 setSendInterfaceIdentifier:0];
          [v5 addObject:v10];
          goto LABEL_12;
        }
      }
LABEL_13:

      ++v9;
    }
    while (v9 < v8);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v5 count];
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v18 = self;
    __int16 v19 = 2048;
    id v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Moving %lu unsent messages to the end of queue", buf, 0x16u);
  }
  [(NSMutableArray *)self->_queue addObjectsFromArray:v5];
  [(APSOutgoingMessageQueue *)self _queueChanged];
}

- (void)_deliverResult:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138413058;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = [v7 priority];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to deliver result %@ for message %@ with priority %d", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v8 = [v7 originator];
  [v8 handleResult:v6 forSendingOutgoingMessage:v7];
}

- (void)_queueChanged
{
  if (![(NSMutableArray *)self->_queue count])
  {
    queue = self->_queue;
    self->_queue = 0;
  }
  [(APSOutgoingMessageQueue *)self _clearCriticalMessageKeepAliveTimerIfAppropriate];
  [(APSOutgoingMessageQueue *)self _recalculateTimer];
  [(APSOutgoingMessageQueue *)self _recalculatePowerAssertion];
  [(APSOutgoingMessageQueue *)self _recalculateDisableFastDormancy];
}

- (void)_recalculateTimer
{
  v2 = self;
  if ([(APSOutgoingMessageQueueDelegate *)self->_delegate shouldForceShortTimeouts]&& [(NSMutableArray *)v2->_queue count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double forcedShortTimeoutDuration = v2->_forcedShortTimeoutDuration;
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v2;
      __int16 v33 = 2048;
      double v34 = forcedShortTimeoutDuration;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ shouldForceShortTimeouts, enforcing maximum %f pending outgoing message duration", buf, 0x16u);
    }
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:v2->_forcedShortTimeoutDuration];
    v2 = self;
  }
  else
  {
    id v4 = 0;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v2->_queue;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v8);
        if (([v9 wasCancelled] & 1) == 0
          && ([v9 hasTimedOut] & 1) == 0)
        {
          if (!self->_criticalMessageKeepAliveTimer
            && [v9 wasSent]
            && [v9 isCritical])
          {
            double criticalMessageTimeout = (double)(unint64_t)self->_criticalMessageTimeout;
            id v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_lastReceivedAckOrReconnect + criticalMessageTimeout];
            __int16 v13 = [v9 timestamp];
            id v14 = [v13 dateByAddingTimeInterval:criticalMessageTimeout];

            if ([v12 compare:v14] == (id)-1)
            {
              id v14 = v14;

              id v12 = v14;
            }
LABEL_23:
          }
          else
          {
            id v14 = [v9 sendTimeoutTime];
            if ([v9 isEager])
            {
              __int16 v15 = [v9 eagernessTimeoutTime];
              BOOL v16 = [v15 compare:v14] == (id)-1;

              if (v16)
              {
                id v12 = [v9 eagernessTimeoutTime];
                goto LABEL_23;
              }
            }
            id v12 = v14;
          }
          if (v4)
          {
            if ([v12 compare:v4] != (id)-1 || v4 == v12) {
              goto LABEL_31;
            }
LABEL_29:
            id v17 = v12;

            id v4 = v17;
          }
          else
          {
            if (v12) {
              goto LABEL_29;
            }
            id v4 = 0;
          }
LABEL_31:
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  unsigned __int8 v18 = self;
  objc_sync_enter(v18);
  if (v4)
  {
    __int16 v19 = [v4 dateByAddingTimeInterval:1.0];
    timer = v18->_timer;
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (timer)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v18;
        __int16 v33 = 2112;
        double v34 = *(double *)&v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Setting outgoing message timer fire date %@", buf, 0x16u);
      }
      [(NSTimer *)v18->_timer setFireDate:v19];
    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v18;
        __int16 v33 = 2112;
        double v34 = *(double *)&v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Creating outgoing message timer with fire date %@", buf, 0x16u);
      }
      id v22 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v19 interval:v18 target:"_timerFired:" selector:0 userInfo:0 repeats:0.0];
      long long v23 = v18->_timer;
      v18->_timer = v22;

      long long v24 = +[NSRunLoop currentRunLoop];
      [v24 addTimer:v18->_timer forMode:NSDefaultRunLoopMode];
    }
LABEL_46:

    goto LABEL_47;
  }
  if (v18->_timer)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Invalidating outgoing message timer", buf, 0xCu);
    }
    [(NSTimer *)v18->_timer invalidate];
    __int16 v19 = v18->_timer;
    v18->_timer = 0;
    goto LABEL_46;
  }
LABEL_47:
  objc_sync_exit(v18);
}

- (void)_recalculatePowerAssertion
{
  unsigned int v3 = [(APSOutgoingMessageQueue *)self hasEagerMessages];
  powerAssertion = self->_powerAssertion;
  if (v3)
  {
    if (!powerAssertion)
    {
      if (self->_powerOptimizationsForExpensiveNetworkingDisabled
        || !+[PCInterfaceMonitor isNetworkingPowerExpensiveToUse])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = [(NSMutableArray *)self->_queue count];
          *(_DWORD *)buf = 138412546;
          id v12 = self;
          __int16 v13 = 2048;
          id v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Creating power assertion - pending message count %lu", buf, 0x16u);
        }
        uint64_t v8 = +[NSString stringWithFormat:@"%@-outgoingmessage", APSBundleIdentifier];
        int v9 = [[APSPowerAssertion alloc] initWithName:v8 category:206 holdDuration:300.0];
        id v10 = self->_powerAssertion;
        self->_powerAssertion = v9;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Not taking power assertion for eager outgoing message, interfaces are expensive to use", buf, 0xCu);
      }
    }
  }
  else if (powerAssertion)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(NSMutableArray *)self->_queue count];
      *(_DWORD *)buf = 138412546;
      id v12 = self;
      __int16 v13 = 2048;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Releasing power assertion - pending message count %lu", buf, 0x16u);
    }
    id v6 = self->_powerAssertion;
    self->_powerAssertion = 0;
  }
}

- (void)_recalculateDisableFastDormancy
{
  unsigned int v3 = [(APSOutgoingMessageQueue *)self hasEagerMessages];
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: disabling fast dormancy.", (uint8_t *)&v6, 0xCu);
    }
    id v5 = +[CUTTelephonyManager sharedInstance];
    [v5 addFastDormancyDisableToken:@"APSDFastDormancyDisableToken"];
  }
  else
  {
    if (v4)
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: un-disabling fast dormancy.", (uint8_t *)&v6, 0xCu);
    }
    id v5 = +[CUTTelephonyManager sharedInstance];
    [v5 removeFastDormancyDisableToken:@"APSDFastDormancyDisableToken"];
  }
}

- (void)_timerFired:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Outgoing message timer fired", buf, 0xCu);
  }
  id v5 = self;
  objc_sync_enter(v5);
  timer = v5->_timer;
  v5->_timer = 0;

  objc_sync_exit(v5);
  id v7 = +[NSArray arrayWithArray:v5->_queue];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v8)
  {
    id v9 = v8;
    id v32 = v4;
    char v33 = 0;
    id v10 = &objc_retain_x28_ptr;
    uint64_t v11 = *(void *)v36;
    while (1)
    {
      id v12 = 0;
      id v34 = v9;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v12);
        id v14 = [v13 sentTimestamp];
        __int16 v15 = [v10[162] date];
        [v15 timeIntervalSinceDate:v14];
        double v17 = v16;

        if (([v13 wasCancelled] & 1) == 0
          && ([v13 hasTimedOut] & 1) == 0)
        {
          uint64_t v18 = v11;
          __int16 v19 = v5;
          id v20 = v10;
          BOOL v21 = v7;
          id v22 = [v13 sendTimeoutTime];
          long long v23 = v20;
          long long v24 = [v20[162] date];
          id v25 = [v22 compare:v24];

          if (v25 == (id)-1)
          {
            APSAlert();
            id v5 = v19;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = [v13 messageID];
              *(_DWORD *)buf = 138412546;
              v40 = v19;
              __int16 v41 = 2048;
              id v42 = v27;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Outgoing message %lu timed out", buf, 0x16u);
            }
            [v13 setTimedOut:1];
            [v13 wasSent];
            long long v28 = APSError();
            [(APSOutgoingMessageQueue *)v19 _deliverResult:v28 forMessage:v13];
            id v7 = v21;
            id v10 = v23;
            uint64_t v11 = v18;
            id v9 = v34;
            if (([v13 wasSent] & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [v13 messageID];
                *(_DWORD *)buf = 138412546;
                v40 = v5;
                __int16 v41 = 2048;
                id v42 = v29;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Removing unsent timed out message %lu from queue", buf, 0x16u);
              }
              [(NSMutableArray *)v5->_queue removeObject:v13];
            }
            if ([v13 isCritical] && (unint64_t)objc_msgSend(v13, "timeout") >= 0x14)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v30 = [v13 timeout];
                *(_DWORD *)buf = 138412546;
                v40 = v5;
                __int16 v41 = 2048;
                id v42 = v30;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Critical message has timed out. Timeout = %lu. Alerting the delegate.", buf, 0x16u);
              }
              [(APSOutgoingMessageQueueDelegate *)v5->_delegate outgoingMessageQueue:v5 lateAcknowledgmentForCriticalOutgoingMessage:v13];
            }
          }
          else
          {
            id v5 = v19;
            if ([(APSOutgoingMessageQueue *)v19 _outgoingMessageIsLateCriticalMessage:v13])
            {
              APSAlert();
              id v7 = v21;
              uint64_t v11 = v18;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = [v13 messageID];
                *(_DWORD *)buf = 138412546;
                v40 = v5;
                __int16 v41 = 2048;
                id v42 = v26;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Acknowledgment for critical outgoing message %lu is late", buf, 0x16u);
              }
              [(APSOutgoingMessageQueue *)v5 _startCriticalMessageFlushTimerSendingFlush];
LABEL_33:
              id v10 = v23;
              id v9 = v34;
              goto LABEL_34;
            }
            id v7 = v21;
            uint64_t v11 = v18;
            if (!v14) {
              goto LABEL_33;
            }
            id v10 = v23;
            id v9 = v34;
            if (v17 > v5->_forcedShortTimeoutDuration
              && [(APSOutgoingMessageQueueDelegate *)v5->_delegate shouldForceShortTimeouts])
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                double forcedShortTimeoutDuration = v5->_forcedShortTimeoutDuration;
                *(_DWORD *)buf = 138413314;
                v40 = v5;
                __int16 v41 = 2112;
                id v42 = v13;
                __int16 v43 = 2112;
                id v44 = v14;
                __int16 v45 = 2048;
                double v46 = v17;
                __int16 v47 = 2048;
                double v48 = forcedShortTimeoutDuration;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: %@ sent at %@ (%f ago) has exceeded the forcedShortTimeoutDuration %f and we're enforcing short timeouts!", buf, 0x34u);
              }
              char v33 = 1;
            }
          }
        }
LABEL_34:

        id v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v49 count:16];
      if (!v9)
      {
        id v4 = v32;
        if (v33) {
          [(APSOutgoingMessageQueueDelegate *)v5->_delegate outgoingMessageQueueShortMessageTimeoutExceeded:v5];
        }
        break;
      }
    }
  }
  [(APSOutgoingMessageQueue *)v5 _queueChanged];
}

- (BOOL)_outgoingMessageIsLateCriticalMessage:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_lastReceivedAckOrReconnect];
  [v5 timeIntervalSinceNow];
  double v7 = v6;
  double criticalMessageTimeout = self->_criticalMessageTimeout;

  if (([(__CFString *)v4 wasCancelled] & 1) != 0
    || ([(__CFString *)v4 hasTimedOut] & 1) != 0)
  {
    goto LABEL_3;
  }
  BOOL v9 = 0;
  if ([(__CFString *)v4 isCritical] && v7 + criticalMessageTimeout < 0.0)
  {
    uint64_t v11 = [(__CFString *)v4 timestamp];
    [v11 timeIntervalSinceNow];
    double v13 = v12 + self->_criticalMessageTimeout;

    if (v13 >= 0.0)
    {
LABEL_3:
      BOOL v9 = 0;
      goto LABEL_4;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      CFStringRef v17 = v4;
      __int16 v18 = 2112;
      CFStringRef v19 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ isLateCriticalMessage ? %@", (uint8_t *)&v16, 0x16u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double lastReceivedAckOrReconnect = self->_lastReceivedAckOrReconnect;
      +[NSDate timeIntervalSinceReferenceDate];
      int v16 = 138412802;
      CFStringRef v17 = @"YES";
      __int16 v18 = 2048;
      CFStringRef v19 = *(const __CFString **)&lastReceivedAckOrReconnect;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lastAckIsTooOld: %@  lastReceivedAck: %f now: %f", (uint8_t *)&v16, 0x20u);
    }
    BOOL v9 = 1;
  }
LABEL_4:

  return v9;
}

- (void)_startCriticalMessageFlushTimerSendingFlush
{
  if (!self->_criticalMessageKeepAliveTimer)
  {
    unint64_t criticalMessageFlushSize = self->_criticalMessageFlushSize;
    uint64_t v4 = 2 * criticalMessageFlushSize;
    if (criticalMessageFlushSize == 512) {
      uint64_t v4 = 512;
    }
    if (criticalMessageFlushSize) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 128;
    }
    self->_unint64_t criticalMessageFlushSize = v5;
    -[APSOutgoingMessageQueueDelegate outgoingMessageQueue:requestCriticalMessageFlushWithPaddingLength:](self->_delegate, "outgoingMessageQueue:requestCriticalMessageFlushWithPaddingLength:", self);
    unint64_t v6 = self->_criticalMessageFlushCount + 1;
    self->_unint64_t criticalMessageFlushCount = v6;
    unint64_t v10 = v6;
    APSAlert();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t criticalMessageFlushCount = self->_criticalMessageFlushCount;
      *(_DWORD *)buf = 138412546;
      double v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = criticalMessageFlushCount;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ _criticalMessageFlushCount is now %lu", buf, 0x16u);
    }
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_criticalMessageKeepAliveTimerFired", 0, 0, self->_criticalMessageKeepAliveTimerDuration, v10);
    id v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    criticalMessageKeepAliveTimer = self->_criticalMessageKeepAliveTimer;
    self->_criticalMessageKeepAliveTimer = v8;
  }
}

- (void)_clearCriticalMessageKeepAliveTimerIfAppropriate
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned int v3 = self->_queue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[APSOutgoingMessageQueue _outgoingMessageIsLateCriticalMessage:](self, "_outgoingMessageIsLateCriticalMessage:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8))
        {

          return;
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [(APSOutgoingMessageQueue *)self _clearCriticalMessageKeepAliveTimer];
  self->_unint64_t criticalMessageFlushCount = 0;
  self->_unint64_t criticalMessageFlushSize = 0;
}

- (void)_clearCriticalMessageKeepAliveTimer
{
  if (self->_criticalMessageKeepAliveTimer)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      criticalMessageKeepAliveTimer = self->_criticalMessageKeepAliveTimer;
      int v5 = 138412546;
      uint64_t v6 = self;
      __int16 v7 = 2112;
      long long v8 = criticalMessageKeepAliveTimer;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ clearingCriticalMessageKeepAliveTimer %@", (uint8_t *)&v5, 0x16u);
    }
    [(NSTimer *)self->_criticalMessageKeepAliveTimer invalidate];
    id v4 = self->_criticalMessageKeepAliveTimer;
    self->_criticalMessageKeepAliveTimer = 0;
  }
}

- (void)_criticalMessageKeepAliveTimerFired
{
  [(APSOutgoingMessageQueue *)self _clearCriticalMessageKeepAliveTimer];
  if (self->_criticalMessageFlushCount >= self->_numberOfCriticalMessageFlushesBeforeDisconnecting)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unsigned int v3 = self->_queue;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (-[APSOutgoingMessageQueue _outgoingMessageIsLateCriticalMessage:](self, "_outgoingMessageIsLateCriticalMessage:", v8, (void)v10))
          {
            id v9 = v8;

            self->_unint64_t criticalMessageFlushCount = 0;
            self->_unint64_t criticalMessageFlushSize = 0;
            if (v9)
            {
              [(APSOutgoingMessageQueueDelegate *)self->_delegate outgoingMessageQueue:self lateAcknowledgmentForCriticalOutgoingMessage:v9];
            }
            return;
          }
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    self->_unint64_t criticalMessageFlushCount = 0;
    self->_unint64_t criticalMessageFlushSize = 0;
  }
  else
  {
    [(APSOutgoingMessageQueue *)self _startCriticalMessageFlushTimerSendingFlush];
  }
}

- (BOOL)hasPendingMessages
{
  return [(NSMutableArray *)self->_queue count] != 0;
}

- (BOOL)hasEagerMessages
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100061BB8;
  v5[3] = &unk_10012B580;
  v5[4] = &v6;
  [(NSMutableArray *)queue enumerateObjectsWithOptions:2 usingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setNumberOfCriticalMessageFlushesBeforeDisconnecting:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    unint64_t v6 = (unint64_t)[v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 3;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numberOfCriticalMessageFlushesBeforeDisconnecting = self->_numberOfCriticalMessageFlushesBeforeDisconnecting;
    int v8 = 138413058;
    char v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = numberOfCriticalMessageFlushesBeforeDisconnecting;
    __int16 v12 = 2048;
    unint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ setNumberOfCriticalMessageFlushesBeforeDisconnecting: changing from %lu to %lu (got number %@)", (uint8_t *)&v8, 0x2Au);
  }
  self->_unint64_t numberOfCriticalMessageFlushesBeforeDisconnecting = v6;
}

- (void)setCriticalMessageKeepAliveTimerDuration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    if (v6 < 2.0) {
      double v7 = 2.0;
    }
    else {
      double v7 = v6;
    }
  }
  else
  {
    double v7 = 10.0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double criticalMessageKeepAliveTimerDuration = self->_criticalMessageKeepAliveTimerDuration;
    int v9 = 138413058;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = criticalMessageKeepAliveTimerDuration;
    __int16 v13 = 2048;
    double v14 = v7;
    __int16 v15 = 2112;
    int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ setCriticalMessageKeepAliveTimerDuration: changing from %f to %f (got number %@)", (uint8_t *)&v9, 0x2Au);
  }
  self->_double criticalMessageKeepAliveTimerDuration = v7;
}

- (void)setCriticalMessageTimeout:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    if (v6 < 2.0) {
      double v7 = 2.0;
    }
    else {
      double v7 = v6;
    }
  }
  else
  {
    double v7 = 10.0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double criticalMessageTimeout = self->_criticalMessageTimeout;
    int v9 = 138413058;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = criticalMessageTimeout;
    __int16 v13 = 2048;
    double v14 = v7;
    __int16 v15 = 2112;
    int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ setCriticalMessageTimeout: changing from %f to %f (got number %@)", (uint8_t *)&v9, 0x2Au);
  }
  self->_double criticalMessageTimeout = v7;
}

- (void)setForcedShortTimeoutInterval:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    if (v6 < 2.0) {
      double v7 = 2.0;
    }
    else {
      double v7 = v6;
    }
  }
  else
  {
    double v7 = 2.0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double forcedShortTimeoutDuration = self->_forcedShortTimeoutDuration;
    int v9 = 138413058;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = forcedShortTimeoutDuration;
    __int16 v13 = 2048;
    double v14 = v7;
    __int16 v15 = 2112;
    int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ setForcedShortTimeoutInterval: changing from %f to %f (got number %@)", (uint8_t *)&v9, 0x2Au);
  }
  self->_double forcedShortTimeoutDuration = v7;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_queue count];
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v10 = a3;
  if ([(NSMutableArray *)self->_queue count] || self->_numberQueued || self->_numberAcked)
  {
    unint64_t numberQueued = self->_numberQueued;
    unint64_t numberAcked = self->_numberAcked;
    CFStringRef v6 = @"Some reverse pushes not acknowledged";
    if (numberAcked == numberQueued) {
      CFStringRef v6 = @"Ok";
    }
    if (numberAcked) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = numberQueued == 0;
    }
    if (v7) {
      CFStringRef v8 = v6;
    }
    else {
      CFStringRef v8 = @"Unable to send reverse pushes";
    }
    [v10 appendDescription:@"reverse push send queue status" stringValue:v8];
    [v10 pushIndent];
    [v10 appendDescription:@"last reverse push queued" timeIntervalValue:self->_lastNotificationQueued];
    unint64_t v9 = self->_numberQueued;
    if (v9) {
      [v10 appendDescription:@"send success rate" successRateWithSuccessCount:self->_numberAcked failureCount:v9 - self->_numberAcked];
    }
    if (self->_numberAcked) {
      [v10 appendDescription:@"last reverse push acknowledged" timeIntervalValue:self->_lastNotificationAcked];
    }
    [v10 popIndent];
  }
}

- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled
{
  return self->_powerOptimizationsForExpensiveNetworkingDisabled;
}

- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3
{
  self->_powerOptimizationsForExpensiveNetworkingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldReportLastReversePushRTT, 0);
  objc_storeStrong((id *)&self->_lastReversePushRTTMilliseconds, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_criticalMessageKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end