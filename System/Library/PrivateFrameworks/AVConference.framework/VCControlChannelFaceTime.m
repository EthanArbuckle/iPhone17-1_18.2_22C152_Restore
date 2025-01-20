@interface VCControlChannelFaceTime
- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4;
- (VCControlChannelFaceTime)initWithCallID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4;
- (void)dealloc;
- (void)sendReliableMessage:(id)a3 withTopic:(id)a4;
@end

@implementation VCControlChannelFaceTime

- (VCControlChannelFaceTime)initWithCallID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCControlChannelFaceTime;
  v6 = [(VCControlChannel *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_callID = a3;
    v6->_SIPHandle = (tagHANDLE *)objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "SIPHandle");
    uint64_t v8 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__VCControlChannelFaceTime_initWithCallID_reportingAgent___block_invoke;
    v11[3] = &unk_1E6DB6420;
    v11[4] = v8;
    v9 = _Block_copy(v11);
    SIPSetMessageDelegateForCallID((uint64_t)v7->_SIPHandle, v7->_callID, (uint64_t)v9);
    _Block_release(v9);
    v7->super.super._reportingAgent = a4;
  }
  return v7;
}

uint64_t __58__VCControlChannelFaceTime_initWithCallID_reportingAgent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (void *)[*(id *)(a1 + 32) strong];
  v6 = (void *)[v5 messageReceivedDelegate];

  return [v6 controlChannel:v5 receivedMessage:a2 transactionID:a3 fromParticipant:0];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  SIPSetMessageDelegateForCallID((uint64_t)self->_SIPHandle, self->_callID, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCControlChannelFaceTime;
  [(VCControlChannel *)&v3 dealloc];
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  int v4 = SIPSendMessage((uint64_t *)&self->_SIPHandle, self->_callID, (char *)objc_msgSend((id)objc_msgSend(a3, "VCCCString"), "UTF8String"), &v7);
  if (v7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 < 0;
  }
  return !v5;
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__VCControlChannelFaceTime_sendReliableMessage_withTopic___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(asyncProcessingQueue, v5);
}

uint64_t __58__VCControlChannelFaceTime_sendReliableMessage_withTopic___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sendReliableMessageAndWait:*(void *)(a1 + 40) withTopic:*(void *)(a1 + 48)];
  id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 168));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) VCCCString];

  return [Weak controlChannel:v4 sendReliableMessage:v5 didSucceed:v2 toParticipant:0];
}

@end