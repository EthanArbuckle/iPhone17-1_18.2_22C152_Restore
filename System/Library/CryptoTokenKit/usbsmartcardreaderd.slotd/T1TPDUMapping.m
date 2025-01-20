@interface T1TPDUMapping
- (T1TPDUMapping)initWithTransmitter:(id)a3 autoIfs:(BOOL)a4 ifs:(unsigned __int8)a5 redundancyCode:(char)a6 bwt:(float)a7;
- (id)secure:(id)a3 APDU:(id)a4;
- (id)transmit:(id)a3;
- (id)transmitCCIDMessage:(id)a3 maxPayload:(unint64_t)a4 transmitted:(id)a5;
- (void)fillQueue:(id)a3 request:(id)a4 ifs:(unsigned __int8)a5;
- (void)handleIBlock:(id)a3 ackBlock:(id)a4 queue:(id)a5 resultData:(id)a6;
- (void)handleRBlock:(id)a3 ackBlock:(id)a4 queue:(id)a5 resultData:(id)a6;
- (void)handleSBlock:(id)a3 ackBlock:(id)a4 queue:(id)a5 abortBlock:(id)a6 resynchBlock:(id)a7;
- (void)waitingTime:(unsigned __int8)a3;
@end

@implementation T1TPDUMapping

- (T1TPDUMapping)initWithTransmitter:(id)a3 autoIfs:(BOOL)a4 ifs:(unsigned __int8)a5 redundancyCode:(char)a6 bwt:(float)a7
{
  int v8 = a6;
  int v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = sub_10000AB84();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v18 = v10;
    __int16 v19 = 1024;
    int v20 = v9;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2048;
    double v24 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "T1TPDUMapping initWithTransmitter autoIFS: %d IFS: %d RC: %d BWT %f", buf, 0x1Eu);
  }

  v16.receiver = self;
  v16.super_class = (Class)T1TPDUMapping;
  v14 = [(APDUMapping *)&v16 initWithTransmitter:v12];

  if (v14)
  {
    *((unsigned char *)&v14->super._wt + 6) = v10;
    v14->_cardSequence = v9;
    LOBYTE(v14->_bwt) = v8;
    *(float *)&v14->_deactivated = a7;
    BYTE1(v14->_bwt) = +[T1TPDUBlock nodeAddressWithSource:0 andDestination:0];
  }
  return v14;
}

- (id)transmitCCIDMessage:(id)a3 maxPayload:(unint64_t)a4 transmitted:(id)a5
{
  id v8 = a5;
  int v9 = +[CCIDMessageView create:111 withPayload:a3];
  [v9 setWLevelParameter:0];
  [v9 setBBWI:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._transmitter);
  v11 = WeakRetained;
  if (a4) {
    unint64_t v12 = a4 + 5;
  }
  else {
    unint64_t v12 = 0;
  }
  v13 = [WeakRetained transmitAndReceive:v9 maxPayload:v12 outTimeout:0 inTimeout:0 transmitted:v8];

  if ([v13 messageType] == 128)
  {
    v14 = [v13 aPayload];
  }
  else
  {
    v15 = sub_10000AB84();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100018258();
    }

    v14 = 0;
  }

  return v14;
}

- (void)fillQueue:(id)a3 request:(id)a4 ifs:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  id v27 = a3;
  id v8 = a4;
  if ((unint64_t)[v8 length] <= v5)
  {
    char v26 = *((unsigned char *)&self->super._wt + 4);
    *((unsigned char *)&self->super._wt + 4) = v26 + 1;
    BOOL v10 = +[T1InformationBlock informationBlockWithNad:BYTE1(self->_bwt) sequence:v26 & 1 moreData:0 informationField:v8 redundancyCode:SLOBYTE(self->_bwt)];
    [v27 enqueueBlock:v10];
  }
  else
  {
    uint64_t v9 = v5;
    BOOL v10 = +[NSMutableArray array];
    [v8 length];
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      char v13 = *((unsigned char *)&self->super._wt + 4);
      *((unsigned char *)&self->super._wt + 4) = v13 + 1;
      uint64_t v14 = v13 & 1;
      unint64_t v15 = v12 + v9;
      id v16 = objc_msgSend(v8, "length", v27);
      uint64_t v17 = BYTE1(self->_bwt);
      if ((unint64_t)v16 <= v12 + v9)
      {
        BOOL v18 = objc_msgSend(v8, "subdataWithRange:", v12, (char *)objc_msgSend(v8, "length") + v11);
        uint64_t bwt_low = SLOBYTE(self->_bwt);
        uint64_t v20 = v17;
        uint64_t v21 = v14;
        uint64_t v22 = 0;
      }
      else
      {
        BOOL v18 = objc_msgSend(v8, "subdataWithRange:", v12, v9);
        uint64_t bwt_low = SLOBYTE(self->_bwt);
        uint64_t v20 = v17;
        uint64_t v21 = v14;
        uint64_t v22 = 1;
      }
      __int16 v23 = +[T1InformationBlock informationBlockWithNad:v20 sequence:v21 moreData:v22 informationField:v18 redundancyCode:bwt_low];

      [v10 addObject:v23];
      v11 -= v9;
      unint64_t v12 = v15;
    }
    while ((unint64_t)[v8 length] >= v15);
    double v24 = [v10 reverseObjectEnumerator];
    v25 = [v24 allObjects];
    [v27 enqueueArray:v25];
  }
}

- (void)handleIBlock:(id)a3 ackBlock:(id)a4 queue:(id)a5 resultData:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  char v13 = sub_10000AB84();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100018390();
  }

  unsigned int v14 = [v10 sequence];
  char v15 = *((unsigned char *)&self->super._wt + 5);
  *((unsigned char *)&self->super._wt + 5) = v15 + 1;
  if (v14 != (v15 & 1))
  {
    id v16 = sub_10000AB84();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10001835C();
    }

    ++*((unsigned char *)&self->super._wt + 5);
  }
  if (a4)
  {
    id v17 = [v11 dequeueBlock];
    BOOL v18 = sub_10000AB84();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100018328();
    }
  }
  if ([v10 lengthByte])
  {
    __int16 v19 = [v10 informationField];
    [v12 appendData:v19];
  }
  if ([v10 moreData])
  {
    uint64_t v20 = +[T1ReadyBlock readyBlockWithNad:BYTE1(self->_bwt) sequence:*((unsigned char *)&self->super._wt + 5) & 1 status:0 redundancyCode:SLOBYTE(self->_bwt)];
    [v11 enqueueBlock:v20];

    uint64_t v21 = sub_10000AB84();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000182F4();
    }
  }
}

- (void)handleRBlock:(id)a3 ackBlock:(id)a4 queue:(id)a5 resultData:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_10000AB84();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10001842C();
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v13 = v10;
    unsigned __int8 v14 = [v13 moreData];
    unsigned int v15 = [v13 sequence];
    unsigned int v16 = [v9 sequence];
    if (v14)
    {
      if (v15 != v16)
      {
        id v17 = [v11 dequeueBlock];
        BOOL v18 = sub_10000AB84();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_1000183C4();
        }
LABEL_14:
      }
    }
    else if (v15 != v16)
    {
      uint64_t v20 = +[T1ReadyBlock readyBlockWithNad:BYTE1(self->_bwt) sequence:*((unsigned char *)&self->super._wt + 5) & 1 status:2 redundancyCode:SLOBYTE(self->_bwt)];
      [v11 enqueueBlock:v20];

      BOOL v18 = sub_10000AB84();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000183F8();
      }
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v10)
  {
    __int16 v19 = +[T1ReadyBlock readyBlockWithNad:BYTE1(self->_bwt) sequence:*((unsigned char *)&self->super._wt + 5) & 1 status:0 redundancyCode:SLOBYTE(self->_bwt)];
    [v11 enqueueBlock:v19];

    char v13 = sub_10000AB84();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000182F4();
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)handleSBlock:(id)a3 ackBlock:(id)a4 queue:(id)a5 abortBlock:(id)a6 resynchBlock:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  char v13 = (void (**)(void))a6;
  unsigned __int8 v14 = (void (**)(void))a7;
  unsigned int v15 = sub_10000AB84();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000186D4();
  }

  unsigned int v16 = [v11 type];
  unsigned int v17 = [v11 operation];
  if (v16)
  {
    if (v17 == 1)
    {
      self->_cardSequence = [v11 uint8Value];
      id v18 = [v12 dequeueBlock];
      __int16 v19 = sub_10000AB84();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1000185C0();
      }
    }
    else if ([v11 operation] == 2)
    {
      v13[2](v13);
      __int16 v19 = sub_10000AB84();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1000185F4();
      }
    }
    else if ([v11 operation])
    {
      __int16 v19 = sub_10000AB84();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10001865C((uint64_t)v11, v19);
      }
    }
    else
    {
      id v27 = [v12 dequeueBlock];
      v14[2](v14);
      __int16 v19 = sub_10000AB84();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100018628();
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v17 == 3)
  {
    uint64_t v20 = BYTE1(self->_bwt);
    uint64_t v21 = [v11 informationField];
    uint64_t v22 = +[T1SupervisoryBlock supervisoryBlockWithNad:v20 operation:3 type:1 informationField:v21 redundancyCode:SLOBYTE(self->_bwt)];
    [v12 enqueueBlock:v22];

    __int16 v19 = sub_10000AB84();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100018460(v11);
    }
    goto LABEL_27;
  }
  if ([v11 operation] == 1)
  {
    self->_cardSequence = [v11 uint8Value];
    uint64_t v23 = BYTE1(self->_bwt);
    double v24 = [v11 informationField];
    v25 = +[T1SupervisoryBlock supervisoryBlockWithNad:v23 operation:1 type:1 informationField:v24 redundancyCode:SLOBYTE(self->_bwt)];
    [v12 enqueueBlock:v25];

    __int16 v19 = sub_10000AB84();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1000184DC(v11);
    }
    goto LABEL_27;
  }
  if ([v11 operation] == 2)
  {
    v13[2](v13);
    char v26 = +[T1SupervisoryBlock supervisoryBlockWithNad:BYTE1(self->_bwt) operation:2 type:1 informationField:0 redundancyCode:SLOBYTE(self->_bwt)];
    [v12 enqueueBlock:v26];

    __int16 v19 = sub_10000AB84();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100018558();
    }
    goto LABEL_27;
  }
  if (![v11 operation])
  {
    v14[2](v14);
    v28 = +[T1SupervisoryBlock supervisoryBlockWithNad:BYTE1(self->_bwt) operation:0 type:1 informationField:0 redundancyCode:SLOBYTE(self->_bwt)];
    [v12 enqueueBlock:v28];

    __int16 v19 = sub_10000AB84();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10001858C();
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (id)transmit:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10000AB84();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000187C0();
  }

  v43 = [[APDU alloc] initWithData:v4];
  v6 = +[NSMutableData data];
  v7 = objc_alloc_init(FIFOQueue);
  if (self->_sequence)
  {
    id v8 = sub_10000AB84();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001878C();
    }
  }
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10000CF04;
  v56[3] = &unk_100024758;
  id v42 = v6;
  id v57 = v42;
  id v9 = v7;
  v58 = v9;
  v59 = self;
  id v39 = v4;
  id v60 = v39;
  id v10 = objc_retainBlock(v56);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10000CF5C;
  v54[3] = &unk_100024780;
  v54[4] = self;
  id v11 = v9;
  v55 = v11;
  v40 = objc_retainBlock(v54);
  v41 = v10;
  ((void (*)(void *))v10[2])(v10);
  if ([(FIFOQueue *)v11 count])
  {
    char v12 = 0;
    while (1)
    {
      if (self->_sequence) {
        goto LABEL_52;
      }
      ++self->_transmissionCounter;
      if (!*((unsigned char *)&self->super._wt + 6) && !*((unsigned char *)&self->super._wt + 7))
      {
        uint64_t v13 = BYTE1(self->_bwt);
        unsigned __int8 v14 = +[NSData dataWithBytes:&self->_cardSequence length:1];
        unsigned int v15 = +[T1SupervisoryBlock supervisoryBlockWithNad:v13 operation:1 type:0 informationField:v14 redundancyCode:SLOBYTE(self->_bwt)];

        unsigned int v16 = sub_10000AB84();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Requesting IFS %{public}@", buf, 0xCu);
        }

        [(FIFOQueue *)v11 enqueueBlock:v15];
        *((unsigned char *)&self->super._wt + 7) = 1;
      }
      unsigned int v17 = [(FIFOQueue *)v11 firstBlock];
      if (([v17 needAck] & 1) == 0) {
        id v18 = [(FIFOQueue *)v11 dequeueBlock];
      }
      __int16 v19 = sub_10000AB84();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, ">>> block: %@", buf, 0xCu);
      }

      uint64_t v20 = [v17 data];
      id v21 = [(APDU *)v43 maxPayload];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10000CFB4;
      v51[3] = &unk_100024780;
      id v22 = v17;
      id v52 = v22;
      v53 = self;
      uint64_t v23 = [(T1TPDUMapping *)self transmitCCIDMessage:v20 maxPayload:v21 transmitted:v51];

      char v50 = 0;
      double v24 = +[T1TPDUBlock blockWithData:redundacyCode:sequence:rcError:](T1TPDUBlock, "blockWithData:redundacyCode:sequence:rcError:", v23, SLOBYTE(self->_bwt), [v22 sequence], &v50);
      v25 = sub_10000AB84();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v24;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "<<< block: %@", buf, 0xCu);
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v26 = [(FIFOQueue *)v11 firstBlock];
        [(T1TPDUMapping *)self handleRBlock:v24 ackBlock:v26 queue:v11 resultData:v42];
        goto LABEL_27;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v26 = [(FIFOQueue *)v11 firstBlock];
        [(T1TPDUMapping *)self handleSBlock:v24 ackBlock:v26 queue:v11 abortBlock:v41 resynchBlock:v40];
        goto LABEL_27;
      }
      if (v12 == 5)
      {
        if (self->_transmissionCounter >= 4)
        {
          v29 = sub_10000AB84();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_100018760(&v44, v45);
          }

          self->_sequence = 1;
          char v12 = 6;
          goto LABEL_28;
        }
LABEL_45:
        ++v12;
        v32 = [(FIFOQueue *)v11 firstBlock];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(FIFOQueue *)v11 enqueueBlock:v22];
          }
          else
          {
            if (v50) {
              uint64_t v34 = 1;
            }
            else {
              uint64_t v34 = 2;
            }
            v35 = +[T1ReadyBlock readyBlockWithNad:BYTE1(self->_bwt) sequence:*((unsigned char *)&self->super._wt + 5) & 1 status:v34 redundancyCode:SLOBYTE(self->_bwt)];
            [(FIFOQueue *)v11 enqueueBlock:v35];
          }
        }
        goto LABEL_28;
      }
      if (v12 != 2) {
        goto LABEL_45;
      }
      unint64_t transmissionCounter = self->_transmissionCounter;
      if (transmissionCounter == 3)
      {
        v28 = sub_10000AB84();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_100018708(&v48, v49);
        }

        self->_sequence = 1;
      }
      else
      {
        if (transmissionCounter < 4) {
          goto LABEL_45;
        }
        v30 = sub_10000AB84();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_100018734(&v46, v47);
        }

        v31 = +[T1SupervisoryBlock supervisoryBlockWithNad:BYTE1(self->_bwt) operation:0 type:0 informationField:0 redundancyCode:SLOBYTE(self->_bwt)];
        [(FIFOQueue *)v11 enqueueBlock:v31];
      }
      char v12 = 3;
LABEL_28:

      if (![(FIFOQueue *)v11 count]) {
        goto LABEL_52;
      }
    }
    char v26 = [(FIFOQueue *)v11 firstBlock];
    [(T1TPDUMapping *)self handleIBlock:v24 ackBlock:v26 queue:v11 resultData:v42];
LABEL_27:

    char v12 = 0;
    goto LABEL_28;
  }
LABEL_52:
  if (self->_sequence) {
    v36 = 0;
  }
  else {
    v36 = v42;
  }
  id v37 = v36;

  return v37;
}

- (void)waitingTime:(unsigned __int8)a3
{
}

- (id)secure:(id)a3 APDU:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000AB84();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000187F4();
  }

  id v9 = objc_alloc_init(FIFOQueue);
  id v27 = v7;
  [(T1TPDUMapping *)self fillQueue:v9 request:v7 ifs:self->_cardSequence];
  id v10 = [(FIFOQueue *)v9 dequeueBlock];
  objc_msgSend(v6, "setNodeAddressByte:", objc_msgSend(v10, "nodeAddressByte"));
  objc_msgSend(v6, "setProtocolControlByte:", objc_msgSend(v10, "protocolControlByte"));
  objc_msgSend(v6, "setLengthByte:", objc_msgSend(v10, "lengthByte"));
  v28 = v6;
  id v11 = [v6 buffer];
  char v12 = +[NSMutableData dataWithData:v11];

  uint64_t v13 = [v10 informationField];
  [v12 appendData:v13];

  unsigned __int8 v14 = +[CCIDMessageView create:105 withPayload:v12];
  [v14 setWLevelParameter:0];
  [v14 setBBWI:0];
  p_transmitter = &self->super._transmitter;
  id WeakRetained = objc_loadWeakRetained((id *)p_transmitter);
  unsigned int v17 = [WeakRetained transmitAndReceive:v14 maxPayload:0 outTimeout:0 inTimeout:&off_1000272B8 transmitted:0];

  int v29 = 6;
  id v18 = [(FIFOQueue *)v9 dequeueBlock];

  if (v18)
  {
    do
    {
      BYTE1(v29) = [v18 nodeAddressByte];
      BYTE2(v29) = [v18 protocolControlByte];
      HIBYTE(v29) = [v18 lengthByte];
      __int16 v19 = +[NSMutableData dataWithBytes:&v29 length:4];

      uint64_t v20 = [v18 informationField];
      [v19 appendData:v20];

      id v21 = +[CCIDMessageView create:105 withPayload:v19];

      [v21 setWLevelParameter:0];
      [v21 setBBWI:0];
      id v22 = objc_loadWeakRetained((id *)p_transmitter);
      uint64_t v23 = [v22 transmitAndReceive:v21 maxPayload:0 outTimeout:0 inTimeout:&off_1000272B8 transmitted:0];

      uint64_t v24 = [(FIFOQueue *)v9 dequeueBlock];

      id v18 = (void *)v24;
      unsigned int v17 = v23;
      unsigned __int8 v14 = v21;
      char v12 = v19;
    }
    while (v24);
  }
  else
  {
    __int16 v19 = v12;
    id v21 = v14;
    uint64_t v23 = v17;
  }
  v25 = [v23 aPayload];

  return v25;
}

@end