@interface DTTapMemoHandler
- (DTTapConfig)config;
- (DTTapMemoHandler)initWithConfig:(id)a3 delegate:(id)a4;
- (id)handleMemo:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation DTTapMemoHandler

- (DTTapMemoHandler)initWithConfig:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTTapMemoHandler;
  v9 = [(DTTapMemoHandler *)&v15 init];
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      sub_23093D660();
    }
    if (!v8) {
      sub_23093D68C();
    }
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.dt.tap.memoHandler", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    v10->_sentRecordingInfo = 0;
  }

  return v10;
}

- (void)suspend
{
}

- (void)resume
{
}

- (id)handleMemo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();
  if (v6)
  {
    if (self->_sentRecordingInfo)
    {
      if ((isKindOfClass & 1) == 0)
      {
LABEL_18:
        id v19 = v4;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = sub_2308B2050;
        v28[3] = &unk_264B8DA70;
        v28[4] = self;
        id v29 = v19;
        v9 = [MEMORY[0x263F086D0] blockOperationWithBlock:v28];
        v10 = v29;
LABEL_19:

        if (v9) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    else
    {
      id v11 = v4;
      if ([(DTTapConfig *)self->_config bufferMode] == 2)
      {
        if ([v11 supportsPeek])
        {
          dispatch_queue_t v12 = [(DTTapConfig *)self->_config recordingInfoHandler];

          if (v12)
          {
            v13 = [(DTTapMemoHandlerDelegate *)self->_delegate peekAtMemo:v11];
            if (v13)
            {
              v14 = [(DTTapConfig *)self->_config recordingInfoHandler];
              ((void (**)(void, void *))v14)[2](v14, v13);

              self->_sentRecordingInfo = 1;
            }
          }
        }
      }

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_18;
      }
    }
    goto LABEL_15;
  }
  if (isKindOfClass)
  {
LABEL_15:
    objc_super v15 = [(DTTapConfig *)self->_config statusHandler];

    if (v15)
    {
      id v16 = v4;
      if (([v16 status] & 0x80000000) != 0)
      {
        v23 = dispatch_get_global_queue(0, 0);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = sub_2308B1EE0;
        v32[3] = &unk_264B8DA70;
        v32[4] = self;
        v18 = &v33;
        id v33 = v16;
        dispatch_async(v23, v32);

        v9 = 0;
      }
      else
      {
        v17 = (void *)MEMORY[0x263F086D0];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = sub_2308B1F98;
        v30[3] = &unk_264B8DA70;
        v30[4] = self;
        v18 = &v31;
        id v31 = v16;
        v9 = [v17 blockOperationWithBlock:v30];
      }

      if (v9) {
        goto LABEL_21;
      }
    }
    goto LABEL_20;
  }
  if (v7)
  {
    id v8 = v4;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_2308B2104;
    v26[3] = &unk_264B8DA70;
    v26[4] = self;
    id v27 = v8;
    v9 = [MEMORY[0x263F086D0] blockOperationWithBlock:v26];
    v10 = v27;
    goto LABEL_19;
  }
LABEL_20:
  v9 = [MEMORY[0x263F086D0] blockOperationWithBlock:&unk_26E515608];
LABEL_21:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308B21B0;
  block[3] = &unk_264B8D590;
  id v21 = v9;
  id v25 = v21;
  dispatch_async(serialQueue, block);

  return v21;
}

- (DTTapConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end