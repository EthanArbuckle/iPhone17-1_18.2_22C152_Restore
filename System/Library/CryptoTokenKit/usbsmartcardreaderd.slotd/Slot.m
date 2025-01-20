@interface Slot
- (BOOL)cardPresent;
- (BOOL)engine:(id)a3 powerDownWithEject:(BOOL)a4;
- (Device)device;
- (NSString)slotName;
- (Slot)initWithDevice:(id)a3 slotName:(id)a4 slotNumber:(unsigned __int8)a5;
- (Synchronize)synchronize;
- (id)engine:(id)a3 transmit:(id)a4;
- (id)engineResetCard:(id)a3;
- (unint64_t)engine:(id)a3 setProtocol:(unint64_t)a4;
- (unsigned)slotNumber;
- (void)cardNotify:(BOOL)a3;
- (void)dealloc;
- (void)terminate;
@end

@implementation Slot

- (Slot)initWithDevice:(id)a3 slotName:(id)a4 slotNumber:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)Slot;
  v10 = [(Slot *)&v39 init];
  if (!v10)
  {
LABEL_19:
    v37 = v10;
    goto LABEL_23;
  }
  v11 = [v8 CCIDDescriptor];
  id v12 = [v11 levelOfExchange];

  switch((unint64_t)v12)
  {
    case 0uLL:
    case 2uLL:
      unint64_t v13 = 261;
      break;
    case 1uLL:
      v14 = [v8 CCIDDescriptor];
      uint64_t v15 = [v14 dwMaxCCIDMessageLength];
      unint64_t v13 = v15 - +[CCIDMessageView length];

      break;
    case 3uLL:
      unint64_t v13 = 65544;
      break;
    default:
      unint64_t v13 = 0;
      break;
  }
  v16 = [v8 CCIDDescriptor];
  uint64_t v17 = [v16 dwMaxCCIDMessageLength];
  unint64_t v18 = v17 - +[CCIDMessageView length];

  if (v13 >= v18) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = v13;
  }
  id v20 = [objc_alloc((Class)TKSlotParameters) initWithMaxBlockSize:v19];
  v21 = [v8 productId];
  [v20 setProductID:v21];

  v22 = [v8 vendorId];
  [v20 setVendorID:v22];

  [v20 setFirmwareVersion:&stru_1000253F0];
  v23 = [v8 CCIDDescriptor];
  objc_msgSend(v20, "setSecurePINVerificationSupported:", (unint64_t)objc_msgSend(v23, "bPINSupport") & 1);

  v24 = [v8 CCIDDescriptor];
  objc_msgSend(v20, "setSecurePINChangeSupported:", (objc_msgSend(v24, "bPINSupport") >> 1) & 1);

  if (([v20 securePINVerificationSupported] & 1) != 0
    || [v20 securePINChangeSupported])
  {
    v25 = [v8 CCIDDescriptor];
    v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 wLcdLayout]);
    [v20 setDisplayMaxCharacters:v26];

    v27 = [v8 CCIDDescriptor];
    v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v27 wLcdLayout] >> 8);
    [v20 setDisplayMaxLines:v28];

    [v20 setPinValidationCondition:&off_100026EE0];
    [v20 setInteractionTimeout:0.0];
  }
  v29 = (TKSmartCardSlotEngine *)[objc_alloc((Class)TKSmartCardSlotEngine) initWithSlotParameters:v20];
  engine = v10->_engine;
  v10->_engine = v29;

  v31 = [[Synchronize alloc] initWithQueueName:@"com.apple.ccid.slot"];
  synchronize = v10->_synchronize;
  v10->_synchronize = v31;

  objc_storeWeak((id *)&v10->_device, v8);
  v10->_slotNumber = a5;
  v10->_cardPresent = 0;
  objc_storeStrong((id *)&v10->_slotName, a4);
  v33 = sub_10000F564();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    sub_100018C00((id *)&v10->_engine);
  }

  unsigned __int8 v34 = [(TKSmartCardSlotEngine *)v10->_engine setupWithName:v9 delegate:v10];
  v35 = sub_10000F564();
  v36 = v35;
  if (v34)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_100018B08(a5, v36);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
    sub_100018B84(a5, v36);
  }

  v37 = 0;
LABEL_23:

  return v37;
}

- (void)dealloc
{
  [(Slot *)self terminate];
  v3.receiver = self;
  v3.super_class = (Class)Slot;
  [(Slot *)&v3 dealloc];
}

- (BOOL)cardPresent
{
  return self->_cardPresent && self->_engine != 0;
}

- (void)terminate
{
  objc_super v3 = [(Slot *)self synchronize];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F6A8;
  v4[3] = &unk_1000244C0;
  v4[4] = self;
  [v3 sync:v4];
}

- (void)cardNotify:(BOOL)a3
{
  p_cardPresent = (unsigned __int8 *)&self->_cardPresent;
  if (self->_cardPresent != a3)
  {
    unsigned __int8 *p_cardPresent = a3;
    v5 = sub_10000F564();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100018D4C((uint64_t)self, p_cardPresent, v5);
    }

    [(TKSmartCardSlotEngine *)self->_engine cardPresent:self->_cardPresent];
  }
}

- (BOOL)engine:(id)a3 powerDownWithEject:(BOOL)a4
{
  v4 = sub_10000F564();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100018DDC();
  }

  return 0;
}

- (unint64_t)engine:(id)a3 setProtocol:(unint64_t)a4
{
  v4 = sub_10000F564();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100018DDC();
  }

  return 0;
}

- (id)engine:(id)a3 transmit:(id)a4
{
  v4 = sub_10000F564();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100018DDC();
  }

  return 0;
}

- (id)engineResetCard:(id)a3
{
  objc_super v3 = sub_10000F564();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_100018DDC();
  }

  return 0;
}

- (Device)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (Device *)WeakRetained;
}

- (unsigned)slotNumber
{
  return self->_slotNumber;
}

- (NSString)slotName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (Synchronize)synchronize
{
  return (Synchronize *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_synchronize, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  objc_destroyWeak((id *)&self->_device);
}

@end