@interface VCEmulatedNetworkQueue
- (VCEmulatedNetworkQueue)initWithPolicies:(id)a3;
- (int)dequeuePacket:(id)a3 time:(double)a4;
- (int)enqueuePacket:(id)a3;
- (int)write:(id)a3;
- (void)dealloc;
- (void)markPacketLoss:(id)a3;
- (void)runUntilTime:(double)a3;
- (void)updateSettingsAtTime:(double)a3;
@end

@implementation VCEmulatedNetworkQueue

- (VCEmulatedNetworkQueue)initWithPolicies:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCEmulatedNetworkQueue;
  v3 = [(VCEmulatedNetworkElement *)&v8 initWithPolicies:a3];
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        policies = v3->super._policies;
        *(_DWORD *)buf = 136315906;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        v12 = "-[VCEmulatedNetworkQueue initWithPolicies:]";
        __int16 v13 = 1024;
        int v14 = 22;
        __int16 v15 = 2112;
        v16 = policies;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Network queue policies: %@", buf, 0x26u);
      }
    }
    v3->_queueBandwidthAlgorithm = objc_alloc_init(VCEmulatedNetworkAlgorithmQueueBandwidth);
    v3->_queueLossAlgorithm = objc_alloc_init(VCEmulatedNetworkAlgorithmQueueLoss);
    v3->_queueDelayAlgorithm = objc_alloc_init(VCEmulatedNetworkAlgorithmQueueDelay);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkQueue;
  [(VCEmulatedNetworkElement *)&v3 dealloc];
}

- (void)updateSettingsAtTime:(double)a3
{
  if (a3 - self->_lastPolicyLoadingTime >= 0.1)
  {
    self->_lastPolicyLoadingTime = a3;
    [(VCEmulatedNetworkAlgorithmQueueBandwidth *)self->_queueBandwidthAlgorithm updateSettingsAtTime:self->super._policies impairments:a3];
    [(VCEmulatedNetworkAlgorithmQueueLoss *)self->_queueLossAlgorithm updateSettingsAtTime:self->super._policies impairments:a3];
    queueDelayAlgorithm = self->_queueDelayAlgorithm;
    policies = self->super._policies;
    [(VCEmulatedNetworkAlgorithmQueueDelay *)queueDelayAlgorithm updateSettingsAtTime:policies impairments:a3];
  }
}

- (void)markPacketLoss:(id)a3
{
}

- (int)write:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 && (v5 = self->super._networkElementQueue) != 0)
  {
    if (!CMSimpleQueueGetCount(v5))
    {
      [a3 arrivalTime];
      objc_msgSend(a3, "setNetworkServiceTime:");
    }
    [(VCEmulatedNetworkQueue *)self markPacketLoss:a3];
    return [(VCEmulatedNetworkQueue *)self enqueuePacket:a3];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      objc_super v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        networkElementQueue = self->super._networkElementQueue;
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCEmulatedNetworkQueue write:]";
        __int16 v14 = 1024;
        int v15 = 56;
        __int16 v16 = 2048;
        uint64_t v17 = networkElementQueue;
        __int16 v18 = 2048;
        id v19 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d networkElementQueue %p and packet %p cannot not be nil!", (uint8_t *)&v10, 0x30u);
      }
    }
    return -1;
  }
}

- (int)enqueuePacket:(id)a3
{
  if (([a3 isLost] & 1) == 0)
  {
    [(VCEmulatedNetworkAlgorithmQueueLoss *)self->_queueLossAlgorithm setPacketCountInNetworkQueue:[(VCEmulatedNetworkAlgorithmQueueLoss *)self->_queueLossAlgorithm packetCountInNetworkQueue]+ 1];
    -[VCEmulatedNetworkAlgorithmQueueLoss setPacketCountBytesInNetworkQueue:](self->_queueLossAlgorithm, "setPacketCountBytesInNetworkQueue:", -[VCEmulatedNetworkAlgorithmQueueLoss packetCountBytesInNetworkQueue](self->_queueLossAlgorithm, "packetCountBytesInNetworkQueue")+ [a3 size]);
  }
  int result = CMSimpleQueueEnqueue(self->super._networkElementQueue, a3);
  if (result)
  {
    int v6 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      objc_super v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCEmulatedNetworkQueue *)v7 enqueuePacket:v8];
      }
    }

    return -1;
  }
  return result;
}

- (void)runUntilTime:(double)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  -[VCEmulatedNetworkQueue updateSettingsAtTime:](self, "updateSettingsAtTime:");
  Head = (void *)CMSimpleQueueGetHead(self->super._networkElementQueue);
  if (Head)
  {
    uint64_t v7 = Head;
    double v8 = 0.0;
    v9 = (os_log_t *)MEMORY[0x1E4F47A50];
    *(void *)&long long v6 = 136316162;
    long long v17 = v6;
    do
    {
      objc_msgSend(v7, "arrivalTime", v17);
      double v11 = v10;
      [v7 networkServiceTime];
      if (v11 >= v12) {
        double v12 = v11;
      }
      if (v8 >= v12) {
        double v12 = v8;
      }
      [v7 setNetworkServiceTime:v12];
      [(VCEmulatedNetworkAlgorithmQueueBandwidth *)self->_queueBandwidthAlgorithm process:v7];
      [(VCEmulatedNetworkAlgorithmQueueDelay *)self->_queueDelayAlgorithm process:v7];
      [(VCEmulatedNetworkAlgorithmQueueDelay *)self->_queueDelayAlgorithm expectedProcessEndTime];
      if (v13 >= a3) {
        break;
      }
      double v8 = v13;
      if (-[VCEmulatedNetworkQueue dequeuePacket:time:](self, "dequeuePacket:time:", v7)
        && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        int v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          int v16 = [v7 packetID];
          *(_DWORD *)buf = v17;
          uint64_t v19 = v14;
          __int16 v20 = 2080;
          v21 = "-[VCEmulatedNetworkQueue runUntilTime:]";
          __int16 v22 = 1024;
          int v23 = 105;
          __int16 v24 = 1024;
          int v25 = v16;
          __int16 v26 = 2048;
          double v27 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to dequeue the packet ID %u at time: %f!", buf, 0x2Cu);
        }
      }
      uint64_t v7 = (void *)CMSimpleQueueGetHead(self->super._networkElementQueue);
    }
    while (v7);
  }
}

- (int)dequeuePacket:(id)a3 time:(double)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [a3 setDepartureTime:a4];
  processCompleteHandler = (void (**)(id, const void *))self->super._processCompleteHandler;
  if (processCompleteHandler)
  {
    uint64_t v7 = CMSimpleQueueDequeue(self->super._networkElementQueue);
    processCompleteHandler[2](processCompleteHandler, v7);
    if (([a3 isLost] & 1) == 0 || objc_msgSend(a3, "isDroppedByAQM"))
    {
      if ([(VCEmulatedNetworkAlgorithmQueueLoss *)self->_queueLossAlgorithm packetCountInNetworkQueue])
      {
        [(VCEmulatedNetworkAlgorithmQueueLoss *)self->_queueLossAlgorithm setPacketCountInNetworkQueue:[(VCEmulatedNetworkAlgorithmQueueLoss *)self->_queueLossAlgorithm packetCountInNetworkQueue]- 1];
        -[VCEmulatedNetworkAlgorithmQueueLoss setPacketCountBytesInNetworkQueue:](self->_queueLossAlgorithm, "setPacketCountBytesInNetworkQueue:", -[VCEmulatedNetworkAlgorithmQueueLoss packetCountBytesInNetworkQueue](self->_queueLossAlgorithm, "packetCountBytesInNetworkQueue")- [a3 size]);
      }
      else
      {
        int32_t Count = CMSimpleQueueGetCount(self->super._networkElementQueue);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          double v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v14 = 136316418;
            uint64_t v15 = v12;
            __int16 v16 = 2080;
            long long v17 = "-[VCEmulatedNetworkQueue dequeuePacket:time:]";
            __int16 v18 = 1024;
            int v19 = 126;
            __int16 v20 = 1024;
            int32_t v21 = Count;
            __int16 v22 = 1024;
            int v23 = [a3 isLost];
            __int16 v24 = 1024;
            int v25 = [a3 sequenceNumber];
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d PacketCountInQueue is bad, size=%d, isLost=%d, seq=%u ", (uint8_t *)&v14, 0x2Eu);
          }
        }
      }
    }

    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCEmulatedNetworkQueue dequeuePacket:time:](v8, v9);
      }
    }
    return -1;
  }
}

- (void)enqueuePacket:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  long long v6 = "-[VCEmulatedNetworkQueue enqueuePacket:]";
  __int16 v7 = 1024;
  int v8 = 77;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue! status: %d", (uint8_t *)&v3, 0x22u);
}

- (void)dequeuePacket:(uint64_t)a1 time:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  __int16 v5 = "-[VCEmulatedNetworkQueue dequeuePacket:time:]";
  __int16 v6 = 1024;
  int v7 = 119;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d _processCompleteHandler is nil. Network element is not connected correctly!", (uint8_t *)&v2, 0x1Cu);
}

@end