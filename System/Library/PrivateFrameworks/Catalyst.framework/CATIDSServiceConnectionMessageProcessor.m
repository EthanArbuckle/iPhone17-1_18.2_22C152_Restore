@interface CATIDSServiceConnectionMessageProcessor
- (CATIDSServiceConnectionMessageProcessor)initWithWorkQueue:(id)a3 connectionIdentifier:(id)a4;
- (CATIDSServiceConnectionMessageProcessorDelegate)delegate;
- (void)receiveMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CATIDSServiceConnectionMessageProcessor

- (CATIDSServiceConnectionMessageProcessor)initWithWorkQueue:(id)a3 connectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATIDSServiceConnectionMessageProcessor;
  v9 = [(CATIDSServiceConnectionMessageProcessor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWorkQueue, a3);
    objc_storeStrong((id *)&v10->mConnectionIdentifier, a4);
  }

  return v10;
}

- (void)receiveMessage:(id)a3
{
  id v39 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v4 = [v39 connectionIdentifier];
  int v5 = [v4 isEqual:self->mConnectionIdentifier];

  if (v5)
  {
    v6 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
    [v6 messageProcessorWantsToExtendKeepAlive:self];

    id v7 = [v39 receivedSequenceNumber];

    if (v7)
    {
      id v8 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
      v9 = [v39 receivedSequenceNumber];
      objc_msgSend(v8, "messageProcessor:wantsToAckUpTo:", self, objc_msgSend(v9, "unsignedIntegerValue"));
    }
    v10 = [v39 content];
    uint64_t v11 = [v10 contentType];

    switch(v11)
    {
      case 1:
        objc_super v12 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
        v13 = [v39 content];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = [MEMORY[0x263F08690] currentHandler];
          v16 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionMessageProcessor receiveMessage:]"];
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          [v15 handleFailureInFunction:v16, @"CATIDSServiceConnectionMessageProcessor.m", 63, @"expected %@, got %@", v18, v20 file lineNumber description];
        }
        [v12 messageProcessor:self wantsAggregation:v13];
        goto LABEL_19;
      case 2:
        objc_super v12 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
        [v12 messageProcessorWantsToAcknowledgeRemote:self];
        goto LABEL_20;
      case 4:
        objc_super v12 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
        v13 = [v39 content];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = [MEMORY[0x263F08690] currentHandler];
          v22 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionMessageProcessor receiveMessage:]"];
          v23 = (objc_class *)objc_opt_class();
          v24 = NSStringFromClass(v23);
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          [v21 handleFailureInFunction:v22, @"CATIDSServiceConnectionMessageProcessor.m", 73, @"expected %@, got %@", v24, v26 file lineNumber description];
        }
        v14 = [v13 error];
        [v12 messageProcessor:self wantsToCloseWithError:v14];
        goto LABEL_18;
      case 5:
        objc_super v12 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
        v13 = [v39 content];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = [MEMORY[0x263F08690] currentHandler];
          v28 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionMessageProcessor receiveMessage:]"];
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          [v27 handleFailureInFunction:v28, @"CATIDSServiceConnectionMessageProcessor.m", 84, @"expected %@, got %@", v30, v32 file lineNumber description];
        }
        objc_msgSend(v12, "messageProcessor:receivedExpectedSequence:", self, objc_msgSend(v13, "expectedSequenceNumber"));
        goto LABEL_19;
      case 6:
        objc_super v12 = [(CATIDSServiceConnectionMessageProcessor *)self delegate];
        v13 = [v39 content];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v33 = [MEMORY[0x263F08690] currentHandler];
          v34 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionMessageProcessor receiveMessage:]"];
          v35 = (objc_class *)objc_opt_class();
          v36 = NSStringFromClass(v35);
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          [v33 handleFailureInFunction:v34, @"CATIDSServiceConnectionMessageProcessor.m", 79, @"expected %@, got %@", v36, v38 file lineNumber description];
        }
        v14 = [v13 sequenceNumbers];
        [v12 messageProcessor:self wantsRetransmission:v14];
LABEL_18:

LABEL_19:
LABEL_20:

        break;
      default:
        break;
    }
  }
}

- (CATIDSServiceConnectionMessageProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionMessageProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mConnectionIdentifier, 0);

  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end