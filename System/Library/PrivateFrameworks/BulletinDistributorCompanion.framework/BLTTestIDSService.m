@interface BLTTestIDSService
- (BLTAbstractIDSDevice)defaultPairedDevice;
- (BLTTestIDSService)initWithService:(id)a3;
- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (id)_lightsAndSirensRequestForProtobuf:(id)a3;
- (unint64_t)_randomResponseDelay;
- (unint64_t)_randomSendDelay;
- (unint64_t)_randomValueBetweenMin:(unint64_t)a3 max:(unint64_t)a4;
- (unint64_t)maximumResponseDelay;
- (unint64_t)maximumSendDelay;
- (unint64_t)minimumResponseDelay;
- (unint64_t)minimumSendDelay;
- (void)_callDelegateActionForProtobuf:(id)a3 delegate:(id)a4 identifier:(id)a5 type:(unsigned __int16)a6 isResponse:(BOOL)a7;
- (void)_handleProtobuf:(id)a3 identifier:(id)a4 sendDelay:(unint64_t)a5;
- (void)_sendBlockToAllDelegatesAfterTime:(unint64_t)a3 block:(id)a4;
- (void)_sendLightsAndSirensRequestForProtobuf:(id)a3 identifier:(id)a4 sendDelay:(unint64_t)a5;
- (void)_sendSetSectionInfoResponseWithIdentifier:(id)a3 sendDelay:(unint64_t)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setMaximumResponseDelay:(unint64_t)a3;
- (void)setMaximumSendDelay:(unint64_t)a3;
- (void)setMinimumResponseDelay:(unint64_t)a3;
- (void)setMinimumSendDelay:(unint64_t)a3;
- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
@end

@implementation BLTTestIDSService

- (BLTTestIDSService)initWithService:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLTTestIDSService;
  v5 = [(BLTTestIDSService *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v5->_currentIdentifier = 1;
    uint64_t v7 = [v4 copy];
    service = v6->_service;
    v6->_service = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    actionsByRequestType = v6->_actionsByRequestType;
    v6->_actionsByRequestType = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    actionsByResponseType = v6->_actionsByResponseType;
    v6->_actionsByResponseType = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v13;

    v15 = [[BLTPBProtobufSequenceNumberManager alloc] initWithServiceName:v6->_service updateSequenceNumbersOnOutOfOrder:0];
    sequenceNumberManager = v6->_sequenceNumberManager;
    v6->_sequenceNumberManager = v15;
  }
  return v6;
}

- (BLTAbstractIDSDevice)defaultPairedDevice
{
  v2 = objc_alloc_init(BLTTestIDSDevice);
  [(BLTTestIDSDevice *)v2 setIsConnected:1];
  [(BLTTestIDSDevice *)v2 setIsDefaultPairedDevice:1];
  [(BLTTestIDSDevice *)v2 setIsNearby:1];
  return (BLTAbstractIDSDevice *)v2;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(BLTTestIDSServiceDelegate);
  [(BLTTestIDSServiceDelegate *)v8 setDelegate:v7];

  [(BLTTestIDSServiceDelegate *)v8 setQueue:v6];
  [(NSMutableArray *)self->_delegates addObject:v8];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  delegates = self->_delegates;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __36__BLTTestIDSService_removeDelegate___block_invoke;
  v10 = &unk_264684B48;
  id v6 = v4;
  id v11 = v6;
  v12 = &v13;
  [(NSMutableArray *)delegates enumerateObjectsUsingBlock:&v7];
  if (v14[3] != 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray removeObjectAtIndex:](self->_delegates, "removeObjectAtIndex:", v7, v8, v9, v10);
  }

  _Block_object_dispose(&v13, 8);
}

void __36__BLTTestIDSService_removeDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 delegate];
  uint64_t v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v8 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  actionsByRequestType = self->_actionsByRequestType;
  uint64_t v7 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)actionsByRequestType setObject:v8 forKeyedSubscript:v7];
}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v8 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  actionsByResponseType = self->_actionsByResponseType;
  uint64_t v7 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)actionsByResponseType setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v10 = a3;
  if (a7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_currentIdentifier);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    ++self->_currentIdentifier;
    a7 = (id *)*a7;
  }
  else
  {
    ++self->_currentIdentifier;
  }
  unint64_t v11 = [(BLTTestIDSService *)self _randomSendDelay];
  delegates = self->_delegates;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke;
  v15[3] = &unk_264684B70;
  uint64_t v16 = a7;
  unint64_t v17 = v11;
  uint64_t v13 = a7;
  [(NSMutableArray *)delegates enumerateObjectsUsingBlock:v15];
  [(BLTTestIDSService *)self _handleProtobuf:v10 identifier:v13 sendDelay:v11];

  return 1;
}

void __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * *(void *)(a1 + 40));
  v5 = [v3 queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke_2;
  v7[3] = &unk_264683BB0;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_after(v4, v5, v7);
}

void __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 service:0 account:0 identifier:*(void *)(a1 + 40) didSendWithSuccess:1 error:0];
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  return 0;
}

- (void)_handleProtobuf:(id)a3 identifier:(id)a4 sendDelay:(unint64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  int v9 = [v10 type];
  switch(v9)
  {
    case 13:
      [(BLTTestIDSService *)self _sendSetSectionInfoResponseWithIdentifier:v8 sendDelay:a5];
      break;
    case 12:
      [(BLTPBProtobufSequenceNumberManager *)self->_sequenceNumberManager setSessionState:0];
      break;
    case 1:
      [(BLTTestIDSService *)self _sendLightsAndSirensRequestForProtobuf:v10 identifier:v8 sendDelay:a5];
      break;
  }
}

- (id)_lightsAndSirensRequestForProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [[BLTPBProtobuf alloc] initWithIDSProtobuf:v4 sequenceNumberManager:self->_sequenceNumberManager];

  id v6 = [BLTPBAddBulletinRequest alloc];
  uint64_t v7 = [(BLTPBProtobuf *)v5 data];
  id v8 = [(BLTPBAddBulletinRequest *)v6 initWithData:v7];

  int v9 = objc_alloc_init(BLTPBHandleDidPlayLightsAndSirensReplyRequest);
  [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v9 setDidPlayLightsAndSirens:1];
  id v10 = [(BLTPBAddBulletinRequest *)v8 bulletin];
  unint64_t v11 = [v10 publisherBulletinID];
  [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v9 setPublisherMatchID:v11];

  v12 = [(BLTPBAddBulletinRequest *)v8 bulletin];
  uint64_t v13 = [v12 sectionID];
  [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)v9 setPhoneSectionID:v13];

  v14 = [MEMORY[0x263EFF910] date];
  [v14 timeIntervalSince1970];
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setDate:](v9, "setDate:");

  return v9;
}

- (void)_sendBlockToAllDelegatesAfterTime:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  delegates = self->_delegates;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke;
  v9[3] = &unk_264684B98;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(NSMutableArray *)delegates enumerateObjectsUsingBlock:v9];
}

void __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, *(void *)(a1 + 40));
  v5 = [v3 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke_2;
  v8[3] = &unk_264683C28;
  id v6 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_after(v4, v5, v8);
}

void __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) delegate];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_sendLightsAndSirensRequestForProtobuf:(id)a3 identifier:(id)a4 sendDelay:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(BLTTestIDSService *)self _randomResponseDelay];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__BLTTestIDSService__sendLightsAndSirensRequestForProtobuf_identifier_sendDelay___block_invoke;
  v14[3] = &unk_264684BC0;
  unint64_t v11 = 1000000000 * (v10 + a5);
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(BLTTestIDSService *)self _sendBlockToAllDelegatesAfterTime:v11 block:v14];
}

void __81__BLTTestIDSService__sendLightsAndSirensRequestForProtobuf_identifier_sendDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v3 _lightsAndSirensRequestForProtobuf:v4];
  id v6 = [[BLTPBProtobuf alloc] initWithProtobuf:v7 type:9 isResponse:0 sequenceNumberManager:*(void *)(*(void *)(a1 + 32) + 48)];
  [*(id *)(a1 + 32) _callDelegateActionForProtobuf:v6 delegate:v5 identifier:*(void *)(a1 + 48) type:9 isResponse:0];
}

- (void)_sendSetSectionInfoResponseWithIdentifier:(id)a3 sendDelay:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(BLTTestIDSService *)self _randomResponseDelay];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__BLTTestIDSService__sendSetSectionInfoResponseWithIdentifier_sendDelay___block_invoke;
  v10[3] = &unk_264684BE8;
  unint64_t v8 = 1000000000 * (v7 + a4);
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(BLTTestIDSService *)self _sendBlockToAllDelegatesAfterTime:v8 block:v10];
}

void __73__BLTTestIDSService__sendSetSectionInfoResponseWithIdentifier_sendDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = objc_alloc_init(BLTPBSetSectionInfoResponse);
  uint64_t v4 = [[BLTPBProtobuf alloc] initWithProtobuf:v5 type:13 isResponse:1 sequenceNumberManager:*(void *)(*(void *)(a1 + 32) + 48)];
  [*(id *)(a1 + 32) _callDelegateActionForProtobuf:v4 delegate:v3 identifier:*(void *)(a1 + 40) type:13 isResponse:1];
}

- (void)_callDelegateActionForProtobuf:(id)a3 delegate:(id)a4 identifier:(id)a5 type:(unsigned __int16)a6 isResponse:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  id v22 = a3;
  id v12 = a4;
  id v13 = (objc_class *)MEMORY[0x263F4A068];
  id v14 = a5;
  id v15 = objc_alloc_init(v13);
  [v15 setIncomingResponseIdentifier:v14];
  [v15 setOutgoingResponseIdentifier:v14];

  uint64_t v16 = 16;
  if (v7) {
    uint64_t v16 = 24;
  }
  id v17 = *(id *)((char *)&self->super.isa + v16);
  [v22 setContext:v15];
  objc_super v18 = [NSNumber numberWithUnsignedShort:v8];
  v19 = [v17 objectForKeyedSubscript:v18];

  uint64_t v20 = [v19 pointerValue];
  id v21 = v12;
  if (objc_opt_respondsToSelector()) {
    ((void (*)(id, uint64_t, id))[v21 methodForSelector:v20])(v21, v20, v22);
  }
  [v22 setContext:0];
}

- (unint64_t)_randomSendDelay
{
  return [(BLTTestIDSService *)self _randomValueBetweenMin:self->_minimumSendDelay max:self->_maximumSendDelay];
}

- (unint64_t)_randomResponseDelay
{
  return [(BLTTestIDSService *)self _randomValueBetweenMin:self->_minimumResponseDelay max:self->_maximumResponseDelay];
}

- (unint64_t)_randomValueBetweenMin:(unint64_t)a3 max:(unint64_t)a4
{
  unint64_t v4 = a3;
  if (a4 > a3) {
    return arc4random() % (a4 - a3) + a3;
  }
  return v4;
}

- (unint64_t)minimumSendDelay
{
  return self->_minimumSendDelay;
}

- (void)setMinimumSendDelay:(unint64_t)a3
{
  self->_minimumSendDelay = a3;
}

- (unint64_t)maximumSendDelay
{
  return self->_maximumSendDelay;
}

- (void)setMaximumSendDelay:(unint64_t)a3
{
  self->_maximumSendDelay = a3;
}

- (unint64_t)minimumResponseDelay
{
  return self->_minimumResponseDelay;
}

- (void)setMinimumResponseDelay:(unint64_t)a3
{
  self->_minimumResponseDelay = a3;
}

- (unint64_t)maximumResponseDelay
{
  return self->_maximumResponseDelay;
}

- (void)setMaximumResponseDelay:(unint64_t)a3
{
  self->_maximumResponseDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumberManager, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_actionsByResponseType, 0);
  objc_storeStrong((id *)&self->_actionsByRequestType, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end