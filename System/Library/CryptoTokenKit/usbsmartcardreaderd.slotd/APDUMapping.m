@interface APDUMapping
- (APDUMapping)initWithTransmitter:(id)a3;
- (APDUMapping)initWithTransmitter:(id)a3 wt:(float)a4;
- (id)secure:(id)a3 APDU:(id)a4;
- (id)transmit:(id)a3;
- (id)transmit:(id)a3 maxPayload:(unint64_t)a4 outTimeout:(id)a5 inTimeout:(id)a6 transmitted:(id)a7;
- (void)waitingTime:(unsigned __int8)a3;
@end

@implementation APDUMapping

- (APDUMapping)initWithTransmitter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APDUMapping;
  v5 = [(APDUMapping *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_transmitter, v4);
    v6->_wt = 0.001;
  }

  return v6;
}

- (APDUMapping)initWithTransmitter:(id)a3 wt:(float)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APDUMapping;
  v7 = [(APDUMapping *)&v10 init];
  objc_super v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_transmitter, v6);
    v8->_wt = a4;
  }

  return v8;
}

- (id)transmit:(id)a3 maxPayload:(unint64_t)a4 outTimeout:(id)a5 inTimeout:(id)a6 transmitted:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  p_transmitter = &self->_transmitter;
  id WeakRetained = objc_loadWeakRetained((id *)p_transmitter);
  v18 = [WeakRetained transmitAndReceive:v12 maxPayload:a4 outTimeout:v13 inTimeout:v14 transmitted:v15];

  if ([v18 messageType] == 128)
  {
    if ([v18 bChainParameter] == 1)
    {
      v19 = [v18 aPayload];
      v20 = +[NSMutableData dataWithData:v19];

      do
      {
        v21 = v18;
        v22 = +[CCIDMessageView create:withPayload:](CCIDMessageView, "create:withPayload:", [v12 messageType], 0);
        [v22 setWLevelParameter:16];
        [v22 setBBWI:0];
        id v23 = objc_loadWeakRetained((id *)p_transmitter);
        v18 = [v23 transmitAndReceive:v22 maxPayload:0 outTimeout:v13 inTimeout:v14 transmitted:v15];

        v24 = [v18 aPayload];
        [v20 appendData:v24];
      }
      while ([v18 bChainParameter] != 2);
      v25 = +[NSData dataWithData:v20];
    }
    else
    {
      v25 = [v18 aPayload];
    }
  }
  else
  {
    v26 = sub_10000AB84();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100018258();
    }

    v25 = 0;
  }

  return v25;
}

- (id)transmit:(id)a3
{
  id v4 = a3;
  v5 = sub_10000AB84();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001828C();
  }

  id v6 = [[APDU alloc] initWithData:v4];
  v7 = [(APDU *)v6 data];
  objc_super v8 = +[CCIDMessageView create:111 withPayload:v7];

  [v8 setWLevelParameter:0];
  [v8 setBBWI:0];
  v9 = [(APDUMapping *)self transmit:v8 maxPayload:[(APDU *)v6 maxPayload] outTimeout:0 inTimeout:0 transmitted:0];

  return v9;
}

- (void)waitingTime:(unsigned __int8)a3
{
}

- (id)secure:(id)a3 APDU:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = sub_10000AB84();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000182C0();
  }

  v9 = [v7 buffer];

  objc_super v10 = +[NSMutableData dataWithData:v9];

  [v10 appendData:v6];
  v11 = +[CCIDMessageView create:105 withPayload:v10];
  [v11 setWLevelParameter:0];
  [v11 setBBWI:0];
  id v12 = [(APDUMapping *)self transmit:v11 maxPayload:0 outTimeout:0 inTimeout:&off_1000272B8 transmitted:0];

  return v12;
}

- (void).cxx_destruct
{
}

@end