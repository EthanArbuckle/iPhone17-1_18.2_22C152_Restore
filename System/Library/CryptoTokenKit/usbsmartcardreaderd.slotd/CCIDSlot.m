@interface CCIDSlot
- (BOOL)PPSForProtocol:(unint64_t)a3 withFIndexDindex:(id)a4 andSPU:(id)a5;
- (BOOL)allowAlternativeFiDi;
- (BOOL)engine:(id)a3 powerDownWithEject:(BOOL)a4;
- (BOOL)tryAlternativeFiDi:(id)a3;
- (CCIDSlot)initWithDevice:(id)a3 slotName:(id)a4 slotNumber:(unsigned __int8)a5 pipeIn:(id)a6 pipeOut:(id)a7;
- (id)changePINSecure:(id)a3 error:(id *)a4;
- (id)coldResetCard;
- (id)engine:(id)a3 escape:(id)a4;
- (id)engine:(id)a3 runUserInteraction:(id)a4 error:(id *)a5;
- (id)engine:(id)a3 transmit:(id)a4;
- (id)engineResetCard:(id)a3;
- (id)escapeCommand:(id)a3;
- (id)findSuitableFDIndexes:(id)a3;
- (id)findSuitableFIndexDIndex:(id)a3;
- (id)getCardsNeedsBaseFiDi;
- (id)getClockFrequencies;
- (id)getDataRates;
- (id)getParameters;
- (id)receiveMessageWitMaxPayload:(unint64_t)a3 sequenceNumber:(unsigned __int8)a4 duplicateMessage:(unsigned __int8)a5 timeout:(id)a6;
- (id)resetParameters;
- (id)setParameters:(id)a3;
- (id)transmitAndReceive:(id)a3 maxPayload:(unint64_t)a4 outTimeout:(id)a5 inTimeout:(id)a6 transmitted:(id)a7;
- (id)transmitAndReceive:(id)a3 maxPayload:(unint64_t)a4 sequence:(id)a5 outTimeout:(id)a6 inTimeout:(id)a7 transmitted:(id)a8;
- (id)transmitAndReceive:(id)a3 maxPayload:(unint64_t)a4 transmitted:(id)a5;
- (id)verifyPINSecure:(id)a3 error:(id *)a4;
- (id)warmResetCard;
- (unint64_t)engine:(id)a3 setProtocol:(unint64_t)a4;
- (unint64_t)setProtocol:(unint64_t)a3;
- (unint64_t)setProtocol_v1:(unint64_t)a3;
- (unint64_t)setProtocol_v2:(unint64_t)a3;
- (unsigned)PPSVersion;
- (void)abort:(unsigned __int8)a3;
- (void)cardNeedsBaseFiDi:(id)a3;
- (void)cardNotify:(BOOL)a3;
- (void)didWakeUpOnEngine:(id)a3;
- (void)sendAnalyticsFailure:(unsigned __int8)a3;
- (void)setDataRateAndClockFrequency:(id)a3;
- (void)setDeviceAndCardBaseFiDi:(id)a3;
- (void)willSleepOnEngine:(id)a3;
@end

@implementation CCIDSlot

- (CCIDSlot)initWithDevice:(id)a3 slotName:(id)a4 slotNumber:(unsigned __int8)a5 pipeIn:(id)a6 pipeOut:(id)a7
{
  uint64_t v9 = a5;
  id v13 = a6;
  id v14 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CCIDSlot;
  v15 = [(Slot *)&v26 initWithDevice:a3 slotName:a4 slotNumber:v9];
  v16 = v15;
  if (!v15) {
    goto LABEL_8;
  }
  uint64_t v17 = [(CCIDSlot *)v15 getCardsNeedsBaseFiDi];
  cardsNeedsBaseFiDi = v16->_cardsNeedsBaseFiDi;
  v16->_cardsNeedsBaseFiDi = (NSMutableArray *)v17;

  v16->_allowAlternativeFiDi = [(CCIDSlot *)v16 allowAlternativeFiDi];
  v16->_PPSVersion = [(CCIDSlot *)v16 PPSVersion];
  objc_storeStrong((id *)&v16->_pipeIn, a6);
  objc_storeStrong((id *)&v16->_pipeOut, a7);
  v19 = +[CCIDMessageView create:101];
  v20 = [(CCIDSlot *)v16 transmitAndReceive:v19 maxPayload:10 transmitted:0];

  if ([v20 messageType] == 129)
  {
    v21 = [v20 status];
    if ([v21 bmCommandStatus])
    {
      unsigned int v22 = [v20 bError];

      if (v22 != -2) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    v24 = [v20 status];
    -[CCIDSlot cardNotify:](v16, "cardNotify:", [v24 bmICCStatus] != 2);

LABEL_8:
    v23 = v16;
    goto LABEL_9;
  }
LABEL_5:

  v23 = 0;
LABEL_9:

  return v23;
}

- (void)cardNotify:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCIDSlot;
  [(Slot *)&v5 cardNotify:a3];
  if (![(Slot *)self cardPresent])
  {
    lastATR = self->_lastATR;
    self->_lastATR = 0;
  }
}

- (void)sendAnalyticsFailure:(unsigned __int8)a3
{
  if (a3 > 5u) {
    v3 = 0;
  }
  else {
    v3 = off_100024720[(char)a3];
  }
  v4 = v3;
  AnalyticsSendEventLazy();
}

- (id)warmResetCard
{
  v3 = sub_1000049C0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000168E0();
  }

  v4 = +[CCIDMessageView create:98];
  objc_super v5 = v4;
  if (self->_lastICCClass == 4) {
    uint64_t lastICCClass = 3;
  }
  else {
    uint64_t lastICCClass = self->_lastICCClass;
  }
  [v4 setBPowerSelect:lastICCClass];
  v7 = [(CCIDSlot *)self transmitAndReceive:v5 maxPayload:33 transmitted:0];
  if ([v7 messageType] == 128
    && ([v7 status],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 bmCommandStatus],
        v8,
        !v9))
  {
    id v14 = objc_alloc((Class)TKSmartCardATR);
    v15 = [v7 aPayload];
    v16 = (TKSmartCardATR *)[v14 initWithBytes:v15];
    lastATR = self->_lastATR;
    self->_lastATR = v16;

    p_super = sub_1000049C0();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      sub_100016804((id *)&self->_lastATR, p_super);
    }
  }
  else
  {
    v10 = sub_1000049C0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000168AC();
    }

    [(CCIDSlot *)self sendAnalyticsFailure:0];
    p_super = &self->_lastATR->super;
    self->_lastATR = 0;
  }

  v12 = self->_lastATR;
  return v12;
}

- (id)coldResetCard
{
  v3 = sub_1000049C0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100016CA4();
  }

  v4 = +[CCIDMessageView create:98];
  objc_super v5 = [(Slot *)self device];
  v6 = [v5 CCIDDescriptor];
  unsigned __int8 v7 = [v6 automaticICCActivation];

  if (v7)
  {
    LODWORD(v8) = 0;
    uint64_t v9 = 0;
  }
  else
  {
    v10 = [(Slot *)self device];
    v11 = [v10 CCIDDescriptor];
    if ([v11 bVoltageSupport])
    {

      LODWORD(v8) = 1;
      uint64_t v9 = 1;
    }
    else
    {
      v12 = [(Slot *)self device];
      id v13 = [v12 CCIDDescriptor];
      unsigned __int8 v14 = [v13 bVoltageSupport];
      if ((v14 & 2) != 0)
      {
        LODWORD(v8) = v14 & 2;
      }
      else
      {
        v15 = [(Slot *)self device];
        v16 = [v15 CCIDDescriptor];
        unint64_t v8 = (unint64_t)[v16 bVoltageSupport] & 4;
      }
      if (v8 == 4) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = v8;
      }
    }
  }
  [v4 setBPowerSelect:v9];
  uint64_t v17 = [(CCIDSlot *)self transmitAndReceive:v4 maxPayload:33 transmitted:0];
  unsigned int v18 = [v17 messageType];
  v19 = sub_1000049C0();
  v20 = v19;
  if (v18 != 128)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000168AC();
    }

    objc_super v26 = self;
    uint64_t v27 = 0;
    goto LABEL_24;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100016C00(v17, v20);
  }

  v21 = [(Slot *)self device];
  unsigned int v22 = [v21 CCIDDescriptor];
  if ([v22 automaticICCActivation])
  {
    v23 = [v17 status];
    unsigned int v24 = [v23 bmICCStatus];

    if (v24)
    {
      v25 = sub_1000049C0();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100016BCC();
      }

      objc_super v26 = self;
      uint64_t v27 = 1;
LABEL_24:
      [(CCIDSlot *)v26 sendAnalyticsFailure:v27];
      v28 = 0;
      goto LABEL_74;
    }
  }
  else
  {
  }
  v29 = [v17 status];
  unsigned int v30 = [v29 bmCommandStatus];

  if (v30)
  {
    id v31 = 0;
    int v32 = 0;
  }
  else
  {
    id v33 = objc_alloc((Class)TKSmartCardATR);
    v34 = [v17 aPayload];
    id v31 = [v33 initWithBytes:v34];

    v35 = [v31 interfaceGroupForProtocol:0x8000];
    v36 = [v35 TA];

    if (v36)
    {
      int v32 = [v36 unsignedIntValue] & 7;
      v37 = sub_1000049C0();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_100016B64();
      }
    }
    else
    {
      int v32 = 0;
    }
  }
  v38 = [(Slot *)self device];
  v39 = [v38 CCIDDescriptor];
  unsigned __int8 v40 = [v39 automaticICCVoltageSelection];

  if (v40)
  {
    v41 = [v17 status];
    unsigned int v42 = [v41 bmCommandStatus];

    if (!v42)
    {
      LOBYTE(v44) = v8;
      goto LABEL_72;
    }
    v43 = sub_1000049C0();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_100016914();
    }

    [(CCIDSlot *)self sendAnalyticsFailure:1];
    v28 = 0;
    goto LABEL_73;
  }
  if (v32)
  {
    LOBYTE(v44) = 0;
    if (!v8 || (v32 & v8) != 0) {
      goto LABEL_72;
    }
    v45 = [(Slot *)self device];
    v46 = [v45 CCIDDescriptor];
    char v47 = [v46 bVoltageSupport] & v32;

    char v48 = v47 & 4;
    if ((v47 & 2) != 0) {
      char v48 = v47 & 2;
    }
    if (v47) {
      LOBYTE(v44) = 1;
    }
    else {
      LOBYTE(v44) = v48;
    }
    v49 = sub_1000049C0();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_100016AFC();
    }
  }
  else
  {
    v50 = [(Slot *)self device];
    v51 = [v50 CCIDDescriptor];
    int v44 = [v51 bVoltageSupport] & v8;

    v49 = sub_1000049C0();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_100016A8C(v49, v52, v53, v54, v55, v56, v57, v58);
    }
  }

  if (!(_BYTE)v44)
  {
    LOBYTE(v44) = 0;
    goto LABEL_72;
  }

  unsigned int v59 = 4;
  while (1)
  {
    if ((v59 & v44) == 0) {
      goto LABEL_65;
    }
    v60 = +[CCIDMessageView create:99];
    v61 = [(CCIDSlot *)self transmitAndReceive:v60 maxPayload:10 transmitted:0];

    if ([v61 messageType] != 129) {
      break;
    }
    v62 = [v61 status];
    unsigned int v63 = [v62 bmCommandStatus];

    if (v63) {
      break;
    }
    +[NSThread sleepForTimeInterval:0.01];
    v64 = +[CCIDMessageView create:98];
    v65 = v64;
    if (v59 == 4) {
      unsigned __int8 v66 = 3;
    }
    else {
      unsigned __int8 v66 = v44;
    }
    [v64 setBPowerSelect:v66];
    uint64_t v17 = [(CCIDSlot *)self transmitAndReceive:v65 maxPayload:33 transmitted:0];

    if ([v17 messageType] == 128)
    {
      v67 = [v17 status];
      unsigned int v68 = [v67 bmCommandStatus];

      if (!v68)
      {
        id v72 = objc_alloc((Class)TKSmartCardATR);
        v73 = [v17 aPayload];
        id v31 = [v72 initWithBytes:v73];

        v74 = sub_1000049C0();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
          sub_100016948(v31, v74);
        }

        goto LABEL_71;
      }
    }
    v69 = sub_1000049C0();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_1000169EC(v75, v65, &v76, v69);
    }

LABEL_65:
    BOOL v70 = v59 >= 2;
    v59 >>= 1;
    if (!v70)
    {
      id v31 = 0;
      goto LABEL_72;
    }
  }
  v65 = sub_1000049C0();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
    sub_100016A58();
  }
  id v31 = 0;
  uint64_t v17 = v61;
LABEL_71:

LABEL_72:
  objc_storeStrong((id *)&self->_lastATR, v31);
  self->_uint64_t lastICCClass = v44;
  v28 = self->_lastATR;
LABEL_73:

LABEL_74:

  return v28;
}

- (id)engineResetCard:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100005288;
  id v13 = sub_100005298;
  id v14 = 0;
  objc_super v5 = [(Slot *)self synchronize];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000052A0;
  v8[3] = &unk_100024530;
  v8[4] = self;
  v8[5] = &v9;
  [v5 sync:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)getDataRates
{
  v3 = sub_1000049C0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100016DA8(self);
  }

  id v4 = [(Slot *)self device];
  objc_super v5 = [v4 CCIDDescriptor];
  unsigned int v6 = [v5 bNumDataRatesSupported];

  if (v6)
  {
    uint64_t v31 = 0;
    unsigned __int8 v7 = [(Slot *)self device];
    unint64_t v8 = [v7 CCIDDescriptor];
    uint64_t v9 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 4 * [v8 bNumDataRatesSupported]);

    v10 = [(Slot *)self device];
    uint64_t v11 = [v10 interface];
    uint64_t v12 = *((unsigned __int8 *)[v11 interfaceDescriptor] + 8);
    id v13 = [v9 length];

    id v14 = [(Slot *)self device];
    v15 = [v14 interface];
    id v30 = 0;
    LODWORD(v13) = [v15 sendDeviceRequest:(v12 << 32) | ((void)v13 << 48) | 0x3A1 data:v9 bytesTransferred:&v31 error:&v30];
    id v16 = v30;

    if (v13)
    {
      uint64_t v17 = [(Slot *)self device];
      unsigned int v18 = [v17 CCIDDescriptor];
      v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 bNumDataRatesSupported]);

      v20 = [(Slot *)self device];
      v21 = [v20 CCIDDescriptor];
      unsigned int v22 = [v21 bNumDataRatesSupported];

      if (v22)
      {
        unint64_t v23 = 0;
        do
        {
          unsigned int v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)[v9 bytes] + v23));
          [v19 addObject:v24];

          ++v23;
          v25 = [(Slot *)self device];
          objc_super v26 = [v25 CCIDDescriptor];
          unsigned int v27 = [v26 bNumDataRatesSupported];
        }
        while (v23 < v27);
      }
      v28 = [v19 sortedArrayUsingComparator:&stru_100024570];
    }
    else
    {
      v19 = sub_1000049C0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100016D40();
      }
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)getClockFrequencies
{
  v3 = sub_1000049C0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100016E48(self);
  }

  id v4 = [(Slot *)self device];
  objc_super v5 = [v4 CCIDDescriptor];
  unsigned int v6 = [v5 bNumClockSupported];

  if (v6)
  {
    uint64_t v31 = 0;
    unsigned __int8 v7 = [(Slot *)self device];
    unint64_t v8 = [v7 CCIDDescriptor];
    uint64_t v9 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 4 * [v8 bNumClockSupported]);

    v10 = [(Slot *)self device];
    uint64_t v11 = [v10 interface];
    uint64_t v12 = *((unsigned __int8 *)[v11 interfaceDescriptor] + 8);
    id v13 = [v9 length];

    id v14 = [(Slot *)self device];
    v15 = [v14 interface];
    id v30 = 0;
    LODWORD(v13) = [v15 sendDeviceRequest:(v12 << 32) | ((void)v13 << 48) | 0x2A1 data:v9 bytesTransferred:&v31 error:&v30];
    id v16 = v30;

    if (v13)
    {
      uint64_t v17 = [(Slot *)self device];
      unsigned int v18 = [v17 CCIDDescriptor];
      v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 bNumDataRatesSupported]);

      v20 = [(Slot *)self device];
      v21 = [v20 CCIDDescriptor];
      unsigned int v22 = [v21 bNumClockSupported];

      if (v22)
      {
        unint64_t v23 = 0;
        do
        {
          unsigned int v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)[v9 bytes] + v23));
          [v19 addObject:v24];

          ++v23;
          v25 = [(Slot *)self device];
          objc_super v26 = [v25 CCIDDescriptor];
          unsigned int v27 = [v26 bNumClockSupported];
        }
        while (v23 < v27);
      }
      v28 = [v19 sortedArrayUsingComparator:&stru_100024590];
    }
    else
    {
      v19 = sub_1000049C0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100016D40();
      }
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)abort:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  objc_super v5 = sub_1000049C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016EE8(v3, self, v5);
  }

  uint64_t v15 = 0;
  uint64_t v6 = [(Slot *)self slotNumber];
  unsigned __int8 v7 = [(Slot *)self device];
  uint64_t v8 = [v7 interface];
  uint64_t v9 = *((unsigned __int8 *)[(id)v8 interfaceDescriptor] + 8);

  v10 = [(Slot *)self device];
  uint64_t v11 = [v10 interface];
  id v14 = 0;
  LOBYTE(v8) = [v11 sendDeviceRequest:((unint64_t)v3 << 24) | (v6 << 16) | (v9 << 32) | 0x121 data:0 bytesTransferred:&v15 error:&v14];
  id v12 = v14;

  if ((v8 & 1) == 0)
  {
    id v13 = sub_1000049C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100016D40();
    }
  }
}

- (BOOL)engine:(id)a3 powerDownWithEject:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  unsigned __int8 v7 = [(Slot *)self synchronize];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005BDC;
  v10[3] = &unk_1000245B8;
  BOOL v11 = a4;
  v10[4] = self;
  v10[5] = &v12;
  [v7 sync:v10];

  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)getParameters
{
  unsigned int v3 = +[CCIDMessageView create:108];
  id v4 = [(CCIDSlot *)self transmitAndReceive:v3 maxPayload:+[ProtocolT1DataView length] transmitted:0];

  if ([v4 messageType] != 130
    || ([v4 status],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 bmCommandStatus],
        v5,
        v6))
  {
    unsigned __int8 v7 = sub_1000049C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100017060(self, v7);
    }
    char v8 = 0;
    goto LABEL_6;
  }
  v10 = [v4 aPayload];
  id v11 = [v10 length];
  unint64_t v12 = +[ProtocolT0DataView length];

  if (v11 == (id)v12)
  {
    id v13 = ProtocolT0DataView;
LABEL_13:
    uint64_t v17 = [v4 aPayload];
    char v8 = [(__objc2_class *)v13 createWithData:v17];

    goto LABEL_15;
  }
  uint64_t v14 = [v4 aPayload];
  id v15 = [v14 length];
  unint64_t v16 = +[ProtocolT1DataView length];

  if (v15 == (id)v16)
  {
    id v13 = ProtocolT1DataView;
    goto LABEL_13;
  }
  char v8 = 0;
LABEL_15:
  unsigned __int8 v7 = sub_1000049C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100016FF8();
  }
LABEL_6:

  return v8;
}

- (id)setParameters:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000049C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100017188(v4, v5);
  }

  unsigned int v6 = [v4 buffer];
  unsigned __int8 v7 = +[CCIDMessageView create:97 withPayload:v6];

  char v8 = objc_opt_class();
  objc_msgSend(v7, "setBProtocolNum:", objc_msgSend(v8, "isEqual:", objc_opt_class()));
  uint64_t v9 = [(CCIDSlot *)self transmitAndReceive:v7 maxPayload:0 transmitted:0];
  if ([v9 messageType] != 130
    || ([v9 status],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 bmCommandStatus],
        v10,
        v11))
  {
    unint64_t v12 = sub_1000049C0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100017154();
    }
    id v13 = 0;
    goto LABEL_8;
  }
  id v15 = [v9 aPayload];
  id v16 = [v15 length];
  unint64_t v17 = +[ProtocolT0DataView length];

  if (v16 == (id)v17)
  {
    unsigned int v18 = ProtocolT0DataView;
LABEL_15:
    unsigned int v22 = [v9 aPayload];
    id v13 = [(__objc2_class *)v18 createWithData:v22];

    goto LABEL_17;
  }
  v19 = [v9 aPayload];
  id v20 = [v19 length];
  unint64_t v21 = +[ProtocolT1DataView length];

  if (v20 == (id)v21)
  {
    unsigned int v18 = ProtocolT1DataView;
    goto LABEL_15;
  }
  id v13 = 0;
LABEL_17:
  unint64_t v12 = sub_1000049C0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000170EC();
  }
LABEL_8:

  return v13;
}

- (id)resetParameters
{
  unsigned int v3 = sub_1000049C0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000172E4();
  }

  id v4 = +[CCIDMessageView create:109];
  objc_super v5 = [(CCIDSlot *)self transmitAndReceive:v4 maxPayload:0 transmitted:0];
  if ([v5 messageType] != 130
    || ([v5 status],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 bmCommandStatus],
        v6,
        v7))
  {
    char v8 = sub_1000049C0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000172B0();
    }
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  unsigned int v11 = [v5 aPayload];
  id v12 = [v11 length];
  unint64_t v13 = +[ProtocolT0DataView length];

  if (v12 == (id)v13)
  {
    uint64_t v14 = ProtocolT0DataView;
LABEL_15:
    unsigned int v18 = [v5 aPayload];
    uint64_t v9 = [(__objc2_class *)v14 createWithData:v18];

    goto LABEL_17;
  }
  id v15 = [v5 aPayload];
  id v16 = [v15 length];
  unint64_t v17 = +[ProtocolT1DataView length];

  if (v16 == (id)v17)
  {
    uint64_t v14 = ProtocolT1DataView;
    goto LABEL_15;
  }
  uint64_t v9 = 0;
LABEL_17:
  char v8 = sub_1000049C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100017248();
  }
LABEL_8:

  return v9;
}

- (id)escapeCommand:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000049C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001734C();
  }

  unsigned int v6 = +[CCIDMessageView create:107 withPayload:v4];
  unsigned int v7 = [(CCIDSlot *)self transmitAndReceive:v6 maxPayload:0 transmitted:0];
  if ([v7 messageType] == 131
    && ([v7 status],
        char v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 bmCommandStatus],
        v8,
        !v9))
  {
    unsigned int v11 = [v7 aPayload];
  }
  else
  {
    v10 = sub_1000049C0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100017318();
    }

    unsigned int v11 = 0;
  }

  return v11;
}

- (BOOL)PPSForProtocol:(unint64_t)a3 withFIndexDindex:(id)a4 andSPU:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 1 && [v8 fIndexDIndex] == 17)
  {
    v10 = sub_1000049C0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000173B4();
    }
    BOOL v11 = 1;
  }
  else
  {
    id v12 = +[NSMutableData data];
    unint64_t v13 = v12;
    char v31 = -1;
    if (v9) {
      char v14 = 48;
    }
    else {
      char v14 = 16;
    }
    char v30 = v14 | (a3 == 2);
    [v12 appendBytes:&v31 length:1];
    [v13 appendBytes:&v30 length:1];
    unsigned __int8 v29 = [v8 fIndexDIndex];
    [v13 appendBytes:&v29 length:1];
    if (v9)
    {
      unsigned __int8 v28 = [v9 unsignedCharValue];
      [v13 appendBytes:&v28 length:1];
    }
    unsigned __int8 v27 = +[RedundancyCheck lrc:v13];
    [v13 appendBytes:&v27 length:1];
    id v15 = v13;
    id v16 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"PPSS: 0x%.2x", *(unsigned __int8 *)[v15 bytes]);
    id v17 = v15;
    objc_msgSend(v16, "appendFormat:", @" PPS0: 0x%.2x", *((unsigned __int8 *)objc_msgSend(v17, "bytes") + 1));
    id v18 = v17;
    if ((*((unsigned char *)[v18 bytes] + 1) & 0x10) != 0)
    {
      objc_msgSend(v16, "appendFormat:", @" PPS1: 0x%.2x", *((unsigned __int8 *)objc_msgSend(v18, "bytes") + 2));
      unsigned int v19 = 3;
    }
    else
    {
      unsigned int v19 = 2;
    }
    id v20 = v18;
    if ((*((unsigned char *)[v20 bytes] + 1) & 0x20) != 0) {
      objc_msgSend(v16, "appendFormat:", @" PPS2: 0x%.2x", *((unsigned __int8 *)objc_msgSend(v20, "bytes") + v19++));
    }
    v10 = v20;
    objc_msgSend(v16, "appendFormat:", @" PCK: 0x%.2x", *((unsigned __int8 *)-[NSObject bytes](v10, "bytes") + v19));
    unint64_t v21 = sub_1000049C0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000173E8();
    }

    unsigned int v22 = +[CCIDMessageView create:111 withPayload:v10];
    [v22 setWLevelParameter:0];
    [v22 setBBWI:0];
    unint64_t v23 = [(CCIDSlot *)self transmitAndReceive:v22 maxPayload:6 transmitted:0];
    unsigned int v24 = [v23 status];
    BOOL v11 = 0;
    if (![v24 bmCommandStatus])
    {
      v25 = [v23 status];
      BOOL v11 = [v25 bmICCStatus] == 0;
    }
  }

  return v11;
}

- (unint64_t)setProtocol_v1:(unint64_t)a3
{
  objc_super v5 = sub_1000049C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100017678();
  }

  uint64_t v105 = [(CCIDSlot *)self getParameters];
  unsigned int v6 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:1];
  uint64_t v7 = [v6 TA];

  id v8 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:0x8000];
  id v9 = [v8 TA];

  if (v9
    && ([(Slot *)self device],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 CCIDDescriptor],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 canSetClockStop],
        v11,
        v10,
        v12))
  {
    unsigned int v95 = [v9 unsignedCharValue] >> 6;
  }
  else
  {
    unsigned int v95 = 0;
  }
  unint64_t v13 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:1];
  char v14 = [v13 TC];

  if (v14) {
    unsigned int v99 = [v14 unsignedCharValue];
  }
  else {
    unsigned int v99 = 0;
  }
  id v15 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:2];
  id v16 = [v15 TC];

  if (v16) {
    unsigned int v98 = [v16 unsignedCharValue];
  }
  else {
    unsigned int v98 = 10;
  }
  id v17 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:2];
  id v18 = [v17 TA];

  v104 = v16;
  if (v18) {
    unsigned int v19 = [v18 unsignedCharValue];
  }
  else {
    unsigned int v19 = 32;
  }
  id v20 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:2];
  unint64_t v21 = [v20 TB];

  v101 = v14;
  if (v21) {
    unsigned int v97 = [v21 unsignedCharValue];
  }
  else {
    unsigned int v97 = 77;
  }
  unsigned int v22 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:2];
  uint64_t v23 = [v22 TC];

  unsigned int v24 = (void *)v23;
  uint64_t v25 = 16;
  v106 = v21;
  v107 = v18;
  v103 = v24;
  if (v24) {
    uint64_t v25 = [v24 unsignedCharValue] & 1 | 0x10;
  }
  objc_super v26 = [(Slot *)self device];
  unsigned __int8 v27 = [v26 CCIDDescriptor];
  unsigned int v28 = [v27 dwMaxIFSD];

  if (v28 >= v19) {
    unsigned __int8 v29 = v19;
  }
  else {
    unsigned __int8 v29 = v28;
  }
  unsigned __int8 v96 = v29;
  char v30 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:2];
  char v31 = [v30 TA];

  v102 = v31;
  if (v31)
  {
    int v32 = (void *)v7;
    v100 = v9;
    uint64_t v33 = (1 << (char)[v31 unsignedCharValue]) & 0xF;
    v34 = (void *)v105;
    goto LABEL_52;
  }
  unint64_t v93 = a3;
  v35 = [(Slot *)self device];
  v36 = [v35 CCIDDescriptor];
  if ([v36 levelOfExchange] != (id)2)
  {
    v37 = [(Slot *)self device];
    v38 = [v37 CCIDDescriptor];
    [v38 levelOfExchange];
  }
  v39 = [(CCIDSlot *)self findSuitableFIndexDIndex:v7];
  unsigned __int8 v40 = [(Slot *)self device];
  v41 = [v40 CCIDDescriptor];
  v94 = (void *)v7;
  if ([v41 automaticPPS])
  {
    v34 = (void *)v105;
  }
  else
  {
    unsigned int v42 = [(Slot *)self device];
    [v42 CCIDDescriptor];
    int v44 = v43 = v9;
    unsigned __int8 v45 = [v44 automaticParametersNegotation];

    id v9 = v43;
    v34 = (void *)v105;
    if (v45) {
      goto LABEL_39;
    }
    v46 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:0x8000];
    v41 = [v46 TB];

    if (v41)
    {
      unint64_t v47 = v93;
      char v48 = v94;
      if (([v41 unsignedCharValue] & 0x80) != 0
        && ([v41 unsignedCharValue] & 0x7F) != 0)
      {
        unsigned __int8 v40 = +[NSNumber numberWithInt:(unint64_t)[v41 unsignedCharValue] & 0x7F];
      }
      else
      {
        unsigned __int8 v40 = 0;
      }
    }
    else
    {
      unsigned __int8 v40 = 0;
      unint64_t v47 = v93;
      char v48 = v94;
    }
    if (![(CCIDSlot *)self PPSForProtocol:v47 withFIndexDindex:v39 andSPU:v40])
    {
      v90 = sub_1000049C0();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
        sub_1000175F0(v39, v90);
      }

      v91 = [(TKSmartCardATR *)self->_lastATR bytes];
      v92 = [v91 hexString];
      [(CCIDSlot *)self cardNeedsBaseFiDi:v92];

      goto LABEL_80;
    }
  }

LABEL_39:
  v49 = [(Slot *)self device];
  v50 = [v49 CCIDDescriptor];
  unsigned __int8 v51 = [v50 automaticParametersNegotation];

  if ((v51 & 1) == 0)
  {
    char v48 = v94;
    if (v93 == 1)
    {
      unsigned __int8 v40 = objc_opt_new();
      objc_msgSend(v40, "setBmFindexDindex:", -[NSObject fIndexDIndex](v39, "fIndexDIndex"));
      [v40 setBClockStop:v95];
      [v40 setBmTCCKS:0];
      [v40 setBGuardTime:v99];
      [v40 setBWaitingInteger:v98];
    }
    else if (v93 == 2)
    {
      unsigned __int8 v40 = objc_opt_new();
      objc_msgSend(v40, "setBmFindexDindex:", -[NSObject fIndexDIndex](v39, "fIndexDIndex"));
      [v40 setBClockStop:v95];
      [v40 setBmTCCKS:v25];
      [v40 setBGuardTime:v99];
      [v40 setBmWaitingIntegers:v97];
      [v40 setBIFSC:v96];
      [v40 setBNadValue:0];
    }
    else
    {
      unsigned __int8 v40 = 0;
    }
    uint64_t v52 = [(CCIDSlot *)self setParameters:v40];

    if (v52)
    {
      int v32 = v94;
      v100 = v9;
      uint64_t v53 = objc_opt_class();
      if ([v53 isEqual:objc_opt_class()]) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 1;
      }

      v34 = (void *)v52;
      goto LABEL_51;
    }
    v41 = sub_1000049C0();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100017588();
    }
    v34 = 0;
LABEL_80:
    v67 = v101;

    unint64_t v65 = 0;
    unsigned int v59 = v106;
    v64 = v107;
    goto LABEL_67;
  }
  v100 = v9;
  uint64_t v33 = v93;
  int v32 = v94;
LABEL_51:

LABEL_52:
  uint64_t v54 = [(Slot *)self device];
  uint64_t v55 = [v54 CCIDDescriptor];
  if (([v55 automaticICCClockFrequency] & 1) == 0)
  {

    unsigned int v59 = v106;
    goto LABEL_56;
  }
  uint64_t v56 = [(Slot *)self device];
  uint64_t v57 = [v56 CCIDDescriptor];
  unsigned __int8 v58 = [v57 automaticBaudRateChange];

  unsigned int v59 = v106;
  if ((v58 & 1) == 0)
  {
LABEL_56:
    v60 = +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v34 bmFindexDindex]);
    [(CCIDSlot *)self setDataRateAndClockFrequency:v60];
  }
  v61 = [(Slot *)self device];
  v62 = [v61 CCIDDescriptor];
  id v63 = [v62 levelOfExchange];

  if (v63 != (id)1)
  {
    v75 = [[APDUMapping alloc] initWithTransmitter:self];
    mapping = self->_mapping;
    self->_mapping = v75;
    id v9 = v100;
    v67 = v101;
    v64 = v107;
    unint64_t v65 = v33;
    goto LABEL_64;
  }
  v64 = v107;
  if (v33 != 1)
  {
    unsigned __int8 v76 = [v34 bmTCCKS];
    uint64_t v77 = +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v34 bmFindexDindex]);
    if (!v77)
    {
      v39 = sub_1000049C0();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100017520();
      }
      unint64_t v65 = 0;
      id v9 = v100;
      v67 = v101;
      char v48 = v32;
      goto LABEL_67;
    }
    mapping = (APDUMapping *)v77;
    long double v78 = ldexp(1.0, v97 >> 4) * 960.0 * 372.0;
    unsigned int v79 = (v78 / (double)(1000 * [(APDUMapping *)mapping fMax]) + 11.0);
    unsigned int v80 = [(APDUMapping *)mapping Fi];
    *(float *)&long double v78 = (float)(v80 / [(APDUMapping *)mapping Di]);
    *(float *)&long double v78 = (float)(1.0 / (float)(1000 * [(APDUMapping *)mapping fMax])) * *(float *)&v78;
    v81 = [T1TPDUMapping alloc];
    v82 = [(Slot *)self device];
    v83 = [v82 CCIDDescriptor];
    id v84 = [v83 automaticIFSD];
    *(float *)&double v85 = *(float *)&v78 * (float)v79;
    v86 = v81;
    v64 = v107;
    v87 = [(T1TPDUMapping *)v86 initWithTransmitter:self autoIfs:v84 ifs:v96 redundancyCode:v76 & 1 bwt:v85];
    v88 = self->_mapping;
    self->_mapping = v87;

    unint64_t v65 = v33;
    unsigned int v59 = v106;
    id v9 = v100;
    v67 = v101;
LABEL_64:
    char v48 = v32;
LABEL_65:

    v39 = sub_1000049C0();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      sub_1000174B8();
    }
    goto LABEL_67;
  }
  unint64_t v65 = 1;
  +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v34 bmFindexDindex]);
  unsigned __int8 v66 = (APDUMapping *)objc_claimAutoreleasedReturnValue();
  v67 = v101;
  char v48 = v32;
  if (v66)
  {
    mapping = v66;
    float v69 = (float)[(APDUMapping *)v66 Fi];
    float v70 = (float)(v69 / (float)(1000 * [(APDUMapping *)mapping fMax])) * (float)v98;
    v71 = [APDUMapping alloc];
    *(float *)&double v72 = v70;
    v73 = [(APDUMapping *)v71 initWithTransmitter:self wt:v72];
    v74 = self->_mapping;
    self->_mapping = v73;

    id v9 = v100;
    goto LABEL_65;
  }
  v39 = sub_1000049C0();
  id v9 = v100;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    sub_100017450();
  }
  unint64_t v65 = 0;
LABEL_67:

  return v65;
}

- (unint64_t)setProtocol_v2:(unint64_t)a3
{
  objc_super v5 = sub_1000049C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100017678();
  }

  unsigned int v6 = [(CCIDSlot *)self getParameters];
  uint64_t v7 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:1];
  uint64_t v104 = [v7 TA];

  id v8 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:0x8000];
  id v9 = [v8 TA];

  if (v9
    && ([(Slot *)self device],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 CCIDDescriptor],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 canSetClockStop],
        v11,
        v10,
        v12))
  {
    unsigned int v108 = [v9 unsignedCharValue] >> 6;
  }
  else
  {
    unsigned int v108 = 0;
  }
  unint64_t v13 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:1];
  char v14 = [v13 TC];

  if (v14) {
    unsigned int v107 = [v14 unsignedCharValue];
  }
  else {
    unsigned int v107 = 0;
  }
  id v15 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:2];
  id v16 = [v15 TC];

  if (v16) {
    unsigned int v103 = [v16 unsignedCharValue];
  }
  else {
    unsigned int v103 = 10;
  }
  id v17 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:2];
  id v18 = [v17 TA];

  unsigned int v98 = v14;
  if (v18) {
    unsigned int v19 = [v18 unsignedCharValue];
  }
  else {
    unsigned int v19 = 32;
  }
  id v20 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:2];
  unint64_t v21 = [v20 TB];

  unsigned __int8 v96 = v21;
  if (v21) {
    unsigned int v101 = [v21 unsignedCharValue];
  }
  else {
    unsigned int v101 = 77;
  }
  unsigned int v22 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:2];
  uint64_t v23 = [v22 TC];

  unint64_t v106 = a3;
  unsigned int v99 = v9;
  unsigned int v95 = v23;
  if (v23) {
    unsigned int v100 = [v23 unsignedCharValue] & 1 | 0x10;
  }
  else {
    unsigned int v100 = 16;
  }
  unsigned int v24 = [(Slot *)self device];
  uint64_t v25 = [v24 CCIDDescriptor];
  unsigned int v26 = [v25 dwMaxIFSD];

  if (v26 >= v19) {
    unsigned __int8 v27 = v19;
  }
  else {
    unsigned __int8 v27 = v26;
  }
  unsigned __int8 v102 = v27;
  unsigned int v28 = [(TKSmartCardATR *)self->_lastATR interfaceGroupAtIndex:2];
  unsigned __int8 v29 = [v28 TA];

  unsigned int v97 = v18;
  v94 = v29;
  if (v29)
  {
    uint64_t v30 = (1 << ([v29 unsignedCharValue] & 0xF));
    char v31 = sub_1000049C0();
    int v32 = v16;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_100017714();
    }
    goto LABEL_73;
  }
  [(CCIDSlot *)self findSuitableFDIndexes:v104];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  id v110 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
  if (!v110)
  {
    uint64_t v30 = 0;
LABEL_72:
    char v31 = obj;
    int v32 = v16;

LABEL_73:
    unint64_t v59 = v30;

    v60 = [(Slot *)self device];
    v61 = [v60 CCIDDescriptor];
    if ([v61 automaticICCClockFrequency])
    {
      v62 = [(Slot *)self device];
      id v63 = [v62 CCIDDescriptor];
      unsigned __int8 v64 = [v63 automaticBaudRateChange];

      if (v64)
      {
LABEL_78:
        unsigned __int8 v66 = [(Slot *)self device];
        v67 = [v66 CCIDDescriptor];
        id v68 = [v67 levelOfExchange];

        if (v68 == (id)1)
        {
          uint64_t v56 = v94;
          if (v59 == 1)
          {
            unint64_t v55 = 1;
            +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v6 bmFindexDindex]);
            float v69 = (APDUMapping *)objc_claimAutoreleasedReturnValue();
            if (v69)
            {
              float v70 = v69;
              float v71 = (float)[(APDUMapping *)v69 Fi];
              float v72 = (float)(v71 / (float)(1000 * [(APDUMapping *)v70 fMax])) * (float)v103;
              v73 = [APDUMapping alloc];
              *(float *)&double v74 = v72;
              v75 = [(APDUMapping *)v73 initWithTransmitter:self wt:v74];
              mapping = self->_mapping;
              self->_mapping = v75;

              goto LABEL_85;
            }
            uint64_t v54 = sub_1000049C0();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
              sub_100017450();
            }
LABEL_93:
            unint64_t v55 = 0;
LABEL_87:
            uint64_t v57 = (void *)v104;
            goto LABEL_88;
          }
          unsigned __int8 v78 = [v6 bmTCCKS];
          uint64_t v79 = +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v6 bmFindexDindex]);
          if (!v79)
          {
            uint64_t v54 = sub_1000049C0();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
              sub_100017520();
            }
            goto LABEL_93;
          }
          float v70 = (APDUMapping *)v79;
          long double v80 = ldexp(1.0, v101 >> 4) * 960.0 * 372.0;
          unsigned __int8 v111 = v78;
          v81 = v6;
          unsigned int v82 = (v80 / (double)(1000 * [(APDUMapping *)v70 fMax]) + 11.0);
          unsigned int v83 = [(APDUMapping *)v70 Fi];
          *(float *)&long double v80 = (float)(v83 / [(APDUMapping *)v70 Di]);
          *(float *)&long double v80 = (float)(1.0 / (float)(1000 * [(APDUMapping *)v70 fMax]))
                         * *(float *)&v80;
          id v84 = [T1TPDUMapping alloc];
          double v85 = [(Slot *)self device];
          v86 = [v85 CCIDDescriptor];
          id v87 = [v86 automaticIFSD];
          float v88 = (float)v82;
          unsigned int v6 = v81;
          *(float *)&double v89 = *(float *)&v80 * v88;
          v90 = [(T1TPDUMapping *)v84 initWithTransmitter:self autoIfs:v87 ifs:v102 redundancyCode:v111 & 1 bwt:v89];
          v91 = self->_mapping;
          self->_mapping = v90;

          uint64_t v56 = v94;
          unint64_t v55 = v59;
        }
        else
        {
          uint64_t v77 = [[APDUMapping alloc] initWithTransmitter:self];
          float v70 = self->_mapping;
          self->_mapping = v77;
          unint64_t v55 = v59;
          uint64_t v56 = v94;
        }
LABEL_85:

        uint64_t v54 = sub_1000049C0();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
          sub_1000174B8();
        }
        goto LABEL_87;
      }
    }
    else
    {
    }
    unint64_t v65 = +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v6 bmFindexDindex]);
    [(CCIDSlot *)self setDataRateAndClockFrequency:v65];

    goto LABEL_78;
  }
  unint64_t v93 = v16;
  uint64_t v109 = *(void *)v113;
  uint64_t v30 = v106;
LABEL_30:
  uint64_t v33 = 0;
  while (1)
  {
    if (*(void *)v113 != v109) {
      objc_enumerationMutation(obj);
    }
    v34 = *(void **)(*((void *)&v112 + 1) + 8 * v33);
    v35 = [(Slot *)self device];
    v36 = [v35 CCIDDescriptor];
    if ([v36 automaticPPS]) {
      break;
    }
    v37 = [(Slot *)self device];
    [v37 CCIDDescriptor];
    v39 = v38 = v6;
    unsigned __int8 v40 = [v39 automaticParametersNegotation];

    unsigned int v6 = v38;
    uint64_t v30 = v106;

    if (v40) {
      goto LABEL_43;
    }
    v41 = [(TKSmartCardATR *)self->_lastATR interfaceGroupForProtocol:0x8000];
    v36 = [v41 TB];

    if (v36
      && ([v36 unsignedCharValue] & 0x80) != 0
      && ([v36 unsignedCharValue] & 0x7F) != 0)
    {
      v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (unint64_t)[v36 unsignedCharValue] & 0x7F);
    }
    else
    {
      v35 = 0;
    }
    unsigned __int8 v42 = [(CCIDSlot *)self PPSForProtocol:v106 withFIndexDindex:v34 andSPU:v35];
    v43 = sub_1000049C0();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);
    if (v42)
    {
      if (v44)
      {
        *(_DWORD *)buf = 138543362;
        v117 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "card accepted FIndexDIndex: %{public}@", buf, 0xCu);
      }

      break;
    }
    if (v44)
    {
      *(_DWORD *)buf = 138543362;
      v117 = v34;
      _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "card rejected FIndexDIndex: %{public}@", buf, 0xCu);
    }

    id v51 = [(CCIDSlot *)self warmResetCard];
LABEL_53:

    if (v110 == (id)++v33)
    {
      id v52 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
      id v110 = v52;
      if (!v52)
      {
        uint64_t v30 = 0;
LABEL_71:
        id v16 = v93;
        goto LABEL_72;
      }
      goto LABEL_30;
    }
  }

LABEL_43:
  unsigned __int8 v45 = [(Slot *)self device];
  v46 = [v45 CCIDDescriptor];
  unsigned __int8 v47 = [v46 automaticParametersNegotation];

  if ((v47 & 1) == 0)
  {
    if (v30 == 1)
    {
      v35 = objc_opt_new();
      objc_msgSend(v35, "setBmFindexDindex:", objc_msgSend(v34, "fIndexDIndex"));
      [v35 setBClockStop:v108];
      [v35 setBmTCCKS:0];
      [v35 setBGuardTime:v107];
      [v35 setBWaitingInteger:v103];
    }
    else if (v30 == 2)
    {
      v35 = objc_opt_new();
      objc_msgSend(v35, "setBmFindexDindex:", objc_msgSend(v34, "fIndexDIndex"));
      [v35 setBClockStop:v108];
      [v35 setBmTCCKS:v100];
      [v35 setBGuardTime:v107];
      [v35 setBmWaitingIntegers:v101];
      [v35 setBIFSC:v102];
      [v35 setBNadValue:0];
    }
    else
    {
      v35 = 0;
    }
    uint64_t v48 = [(CCIDSlot *)self setParameters:v35];

    if (v48)
    {
      unsigned __int8 v58 = objc_opt_class();
      if ([v58 isEqual:objc_opt_class()]) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 1;
      }

      unsigned int v6 = (void *)v48;
      goto LABEL_71;
    }
    v49 = sub_1000049C0();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v117 = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "failed to set parameters: %{public}@", buf, 0xCu);
    }

    id v50 = [(CCIDSlot *)self warmResetCard];
    unsigned int v6 = 0;
    goto LABEL_53;
  }
  if (v30) {
    goto LABEL_71;
  }
  uint64_t v53 = sub_1000049C0();
  uint64_t v54 = obj;
  int v32 = v93;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_1000176E0();
  }

  unint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = (void *)v104;
LABEL_88:

  return v55;
}

- (unint64_t)setProtocol:(unint64_t)a3
{
  if (self->_PPSVersion == 1) {
    return [(CCIDSlot *)self setProtocol_v1:a3];
  }
  else {
    return [(CCIDSlot *)self setProtocol_v2:a3];
  }
}

- (void)setDataRateAndClockFrequency:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CCIDSlot *)self getClockFrequencies];
  v39 = self;
  [(CCIDSlot *)self getDataRates];
  v38 = v37 = v5;
  uint64_t v50 = 0;
  if (v5)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v45;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          unsigned int v12 = [v11 unsignedIntValue];
          if (v12 <= [v4 fMax])
          {
            unsigned int v13 = [v11 unsignedIntValue];
            char v14 = [(Slot *)v39 device];
            id v15 = [v14 CCIDDescriptor];
            unsigned int v16 = [v15 dwMaximumClock];

            if (v13 <= v16)
            {
              unsigned int v17 = [v11 unsignedIntValue];
              LODWORD(v50) = v17;
              id v18 = sub_1000049C0();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                sub_100017844(v17);
              }

              goto LABEL_15;
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    objc_super v5 = v37;
  }
  if (v38)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v19 = v38;
    id v20 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v41;
      while (2)
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          unsigned int v24 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
          unsigned int v25 = [v24 unsignedIntValue];
          if (v25 <= [v4 bpsMax])
          {
            unsigned int v26 = [v24 unsignedIntValue];
            unsigned __int8 v27 = [(Slot *)v39 device];
            unsigned int v28 = [v27 CCIDDescriptor];
            unsigned int v29 = [v28 dwMaxDataRate];

            if (v26 <= v29)
            {
              unsigned int v30 = [v24 unsignedIntValue];
              HIDWORD(v50) = v30;
              char v31 = sub_1000049C0();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                sub_1000177CC(v30);
              }

              goto LABEL_30;
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_30:

    objc_super v5 = v37;
  }
  int v32 = +[NSData dataWithBytes:&v50 length:8];
  uint64_t v33 = +[CCIDMessageView create:115 withPayload:v32];
  v34 = [(CCIDSlot *)v39 transmitAndReceive:v33 maxPayload:0 sequence:&off_100026EC8 outTimeout:0 inTimeout:0 transmitted:0];
  if ([v34 messageType] != 132) {
    goto LABEL_34;
  }
  v35 = [v34 status];
  if (![v35 bmCommandStatus])
  {
LABEL_36:

    goto LABEL_37;
  }
  unsigned int v36 = [v34 bError];

  if (v36 != -2)
  {
LABEL_34:
    v35 = sub_1000049C0();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100017748();
    }
    goto LABEL_36;
  }
LABEL_37:
}

- (unint64_t)engine:(id)a3 setProtocol:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v7 = [(Slot *)self synchronize];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008200;
  v10[3] = &unk_1000245E0;
  v10[5] = &v11;
  void v10[6] = a4;
  v10[4] = self;
  [v7 sync:v10];

  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)engine:(id)a3 transmit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100005288;
  id v19 = sub_100005298;
  id v20 = 0;
  unint64_t v8 = [(Slot *)self synchronize];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000084B8;
  v12[3] = &unk_100024608;
  v12[4] = self;
  uint64_t v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [v8 sync:v12];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)engine:(id)a3 escape:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100005288;
  id v19 = sub_100005298;
  id v20 = 0;
  unint64_t v8 = [(Slot *)self synchronize];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000086C0;
  v12[3] = &unk_100024630;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  [v8 sync:v12];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)willSleepOnEngine:(id)a3
{
  id v4 = [(Slot *)self synchronize];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000087B0;
  v5[3] = &unk_1000244C0;
  v5[4] = self;
  [v4 sync:v5];
}

- (void)didWakeUpOnEngine:(id)a3
{
  id v4 = [(Slot *)self synchronize];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000888C;
  v5[3] = &unk_1000244C0;
  v5[4] = self;
  [v4 sync:v5];
}

- (id)engine:(id)a3 runUserInteraction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100005288;
  uint64_t v22 = sub_100005298;
  id v23 = 0;
  id v10 = [(Slot *)self synchronize];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008AF4;
  v14[3] = &unk_100024658;
  v14[4] = self;
  id v11 = v9;
  id v15 = v11;
  unsigned int v16 = &v18;
  uint64_t v17 = a5;
  [v10 sync:v14];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)verifyPINSecure:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = sub_1000049C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100017BF0();
  }

  id v8 = [(Slot *)self device];
  id v9 = [v8 CCIDDescriptor];
  unsigned __int8 v10 = [v9 bPINSupport];

  if (v10)
  {
    id v11 = +[PINVerificationDataView createWithInteraction:v6 error:a4];
    if (v11)
    {
      mapping = self->_mapping;
      id v13 = [v6 APDU];
      uint64_t v14 = [(APDUMapping *)mapping secure:v11 APDU:v13];

      goto LABEL_11;
    }
  }
  else
  {
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:0];
    }
    id v11 = sub_1000049C0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100017BBC();
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (id)changePINSecure:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = sub_1000049C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100017C58();
  }

  id v8 = [(Slot *)self device];
  id v9 = [v8 CCIDDescriptor];
  unsigned __int8 v10 = [v9 bPINSupport];

  if ((v10 & 2) != 0)
  {
    id v11 = +[PINModificationDataView createWithInteraction:v6 error:a4];
    if (v11)
    {
      mapping = self->_mapping;
      id v13 = [v6 APDU];
      uint64_t v14 = [(APDUMapping *)mapping secure:v11 APDU:v13];

      goto LABEL_11;
    }
  }
  else
  {
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:0];
    }
    id v11 = sub_1000049C0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100017C24();
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (id)findSuitableFIndexDIndex:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v4 unsignedCharValue]);
    id v7 = sub_1000049C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100017D68();
    }

    long long v42 = +[NSMutableArray array];
    id v8 = [(Slot *)self device];
    id v9 = [v8 CCIDDescriptor];
    unsigned int v10 = [v9 dwMaximumClock];

    id v11 = [(Slot *)self device];
    id v12 = [v11 CCIDDescriptor];
    unsigned int v43 = [v12 dwMaxDataRate];

    id v13 = sub_1000049C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100017CF4(v10);
    }

    uint64_t v14 = [(TKSmartCardATR *)self->_lastATR bytes];
    id v15 = [v14 hexString];
    unsigned int v16 = [(CCIDSlot *)self tryAlternativeFiDi:v15];

    if (v16)
    {
      v37 = v5;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = +[CCIDFiAndDi FIndexes];
      id v40 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v40)
      {
        uint64_t v39 = *(void *)v53;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v53 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v41 = v17;
            uint64_t v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v19 = +[CCIDFiAndDi DIndexes];
            id v20 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v49;
              do
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  unsigned int v24 = -[CCIDFiAndDi initWithFIndex:DIndex:]([CCIDFiAndDi alloc], "initWithFIndex:DIndex:", [v18 unsignedCharValue], objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "unsignedCharValue"));
                  unsigned int v25 = [(CCIDFiAndDi *)v24 fIndex];
                  if (v25 == [v6 fIndex])
                  {
                    unsigned int v26 = [(CCIDFiAndDi *)v24 bpsMax];
                    if (v26 <= [v6 bpsMax]
                      && [(CCIDFiAndDi *)v24 baseBps] <= v43)
                    {
                      [v42 addObject:v24];
                    }
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
              }
              while (v21);
            }

            uint64_t v17 = v41 + 1;
          }
          while ((id)(v41 + 1) != v40);
          id v40 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v40);
      }

      objc_super v5 = v37;
      if ([v42 count])
      {
        unsigned __int8 v27 = [v42 sortedArrayUsingComparator:&stru_100024698];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v28 = [v27 countByEnumeratingWithState:&v44 objects:v58 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v45;
          do
          {
            char v31 = 0;
            do
            {
              if (*(void *)v45 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v31);
              uint64_t v33 = sub_1000049C0();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v57 = v32;
                _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "suitable FIndexDIndex: %{public}@", buf, 0xCu);
              }

              char v31 = (char *)v31 + 1;
            }
            while (v29 != v31);
            id v29 = [v27 countByEnumeratingWithState:&v44 objects:v58 count:16];
          }
          while (v29);
        }
        id v34 = [v27 firstObject];

        objc_super v5 = v37;
LABEL_40:

        if (v34) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
    else if ([v6 bpsMax] <= v43 && objc_msgSend(v6, "fMax") <= v10)
    {
      id v34 = v6;
      goto LABEL_40;
    }
  }
LABEL_41:
  id v34 = +[CCIDFiAndDi createWithFIndexDIndex:17];
LABEL_42:
  v35 = sub_1000049C0();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    sub_100017C8C();
  }

  return v34;
}

- (id)findSuitableFDIndexes:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_37;
  }
  id v33 = v4;
  id v6 = +[CCIDFiAndDi createWithFIndexDIndex:](CCIDFiAndDi, "createWithFIndexDIndex:", [v4 unsignedCharValue]);
  id v7 = sub_1000049C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100017D68();
  }

  v38 = +[NSMutableArray array];
  id v8 = [(Slot *)self device];
  id v9 = [v8 CCIDDescriptor];
  unsigned int v10 = [v9 dwMaximumClock];

  id v11 = [(Slot *)self device];
  id v12 = [v11 CCIDDescriptor];
  unsigned int v39 = [v12 dwMaxDataRate];

  id v13 = sub_1000049C0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100017CF4(v10);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = +[CCIDFiAndDi FIndexes];
  id v36 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v49;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v14;
        id v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        unsigned int v16 = +[CCIDFiAndDi DIndexes];
        id v17 = [v16 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v45;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v45 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = -[CCIDFiAndDi initWithFIndex:DIndex:]([CCIDFiAndDi alloc], "initWithFIndex:DIndex:", [v15 unsignedCharValue], objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "unsignedCharValue"));
              unsigned int v22 = [(CCIDFiAndDi *)v21 fMax];
              if (v22 <= [v6 fMax])
              {
                unsigned int v23 = [(CCIDFiAndDi *)v21 bpsMax];
                if (v23 <= [v6 bpsMax] && -[CCIDFiAndDi baseBps](v21, "baseBps") <= v39) {
                  [v38 addObject:v21];
                }
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v44 objects:v56 count:16];
          }
          while (v18);
        }

        uint64_t v14 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v36);
  }

  if (![v38 count])
  {

    objc_super v5 = v33;
LABEL_37:
    char v31 = +[CCIDFiAndDi createWithFIndexDIndex:17];
    long long v52 = v31;
    unsigned int v24 = +[NSArray arrayWithObjects:&v52 count:1];

    goto LABEL_38;
  }
  unsigned int v24 = [v38 sortedArrayUsingComparator:&stru_1000246B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      id v28 = 0;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v28);
        uint64_t v30 = sub_1000049C0();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v54 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "suitable FIndexDIndex: %{public}@", buf, 0xCu);
        }

        id v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v40 objects:v55 count:16];
    }
    while (v26);
  }

  objc_super v5 = v33;
  if (!v24) {
    goto LABEL_37;
  }
LABEL_38:

  return v24;
}

- (id)receiveMessageWitMaxPayload:(unint64_t)a3 sequenceNumber:(unsigned __int8)a4 duplicateMessage:(unsigned __int8)a5 timeout:(id)a6
{
  uint64_t v6 = a5;
  uint64_t v7 = a4;
  id v10 = a6;
  pipeIn = self->_pipeIn;
  id v12 = [(Slot *)self device];
  id v13 = [v12 CCIDDescriptor];
  uint64_t v14 = -[IOUSBHostPipe receive:timeout:](pipeIn, "receive:timeout:", [v13 dwMaxCCIDMessageLength], v10);

  id v15 = [v14 length];
  if (v15 >= (id)+[CCIDMessageView length])
  {
    id v18 = (char *)[v14 length];
    if (v18 > (char *)+[CCIDMessageView length] + a3)
    {
      uint64_t v19 = sub_1000049C0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100017F08(v14, v19);
      }
    }
    id v20 = +[CCIDMessageView createWithData:v14];
    unsigned int v21 = [v20 bSlot];
    if (v21 == [(Slot *)self slotNumber])
    {
      unsigned int v22 = [v20 bSeq];
      if (v6 <= 0x1F && v22 != v7)
      {
        unsigned int v23 = sub_1000049C0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v37[0] = 67109632;
          v37[1] = [v20 bSeq];
          __int16 v38 = 1024;
          int v39 = v7;
          __int16 v40 = 1024;
          int v41 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Duplicate message detected (%u, %u, %u)!", (uint8_t *)v37, 0x14u);
        }

        uint64_t v24 = (v6 + 1);
        id v25 = self;
        unint64_t v26 = a3;
        uint64_t v27 = v7;
        goto LABEL_23;
      }
      if ([v20 bSeq] == v7)
      {
        char v31 = [v20 status];
        unsigned int v32 = [v31 bmCommandStatus];

        if (v32 != 128)
        {
          id v34 = v20;
          goto LABEL_24;
        }
        id v33 = sub_1000049C0();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100017E04();
        }

        id v25 = self;
        unint64_t v26 = a3;
        uint64_t v27 = v7;
        uint64_t v24 = v6;
LABEL_23:
        id v34 = [(CCIDSlot *)v25 receiveMessageWitMaxPayload:v26 sequenceNumber:v27 duplicateMessage:v24 timeout:v10];
LABEL_24:
        id v17 = v34;
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v35 = sub_1000049C0();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100017E38();
      }

      uint64_t v29 = self;
      uint64_t v30 = 5;
    }
    else
    {
      id v28 = sub_1000049C0();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100017EA0();
      }

      uint64_t v29 = self;
      uint64_t v30 = 4;
    }
    [(CCIDSlot *)v29 sendAnalyticsFailure:v30];
    id v17 = 0;
    goto LABEL_29;
  }
  unsigned int v16 = sub_1000049C0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100017DD0();
  }

  [(CCIDSlot *)self sendAnalyticsFailure:3];
  id v17 = 0;
LABEL_30:

  return v17;
}

- (id)transmitAndReceive:(id)a3 maxPayload:(unint64_t)a4 sequence:(id)a5 outTimeout:(id)a6 inTimeout:(id)a7 transmitted:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [(Slot *)self device];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100009E74;
  v27[3] = &unk_1000246E0;
  id v32 = v18;
  unint64_t v33 = a4;
  v27[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v20 = v17;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = [v19 deviceAccessBlock:v27];

  return v25;
}

- (id)transmitAndReceive:(id)a3 maxPayload:(unint64_t)a4 outTimeout:(id)a5 inTimeout:(id)a6 transmitted:(id)a7
{
  return [(CCIDSlot *)self transmitAndReceive:a3 maxPayload:a4 sequence:0 outTimeout:a5 inTimeout:a6 transmitted:a7];
}

- (id)transmitAndReceive:(id)a3 maxPayload:(unint64_t)a4 transmitted:(id)a5
{
  return [(CCIDSlot *)self transmitAndReceive:a3 maxPayload:a4 sequence:0 outTimeout:0 inTimeout:0 transmitted:a5];
}

- (BOOL)allowAlternativeFiDi
{
  v2 = (void *)CFPreferencesCopyValue(@"AllowAlternativeFiDi", @"com.apple.security.smartcard", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)getCardsNeedsBaseFiDi
{
  v2 = (void *)CFPreferencesCopyValue(@"CardsNeedsBaseFiDi", @"com.apple.security.smartcard", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 mutableCopy];
  }
  else
  {
    id v3 = +[NSMutableArray array];
  }
  id v4 = v3;

  return v4;
}

- (void)setDeviceAndCardBaseFiDi:(id)a3
{
}

- (BOOL)tryAlternativeFiDi:(id)a3
{
  return ([(NSMutableArray *)self->_cardsNeedsBaseFiDi containsObject:a3] & 1) == 0
      && self->_allowAlternativeFiDi;
}

- (void)cardNeedsBaseFiDi:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [(CCIDSlot *)self getCardsNeedsBaseFiDi];
    cardsNeedsBaseFiDi = self->_cardsNeedsBaseFiDi;
    self->_cardsNeedsBaseFiDi = v4;

    if (([(NSMutableArray *)self->_cardsNeedsBaseFiDi containsObject:v6] & 1) == 0)
    {
      [(NSMutableArray *)self->_cardsNeedsBaseFiDi addObject:v6];
      [(CCIDSlot *)self setDeviceAndCardBaseFiDi:self->_cardsNeedsBaseFiDi];
    }
  }
}

- (unsigned)PPSVersion
{
  v2 = (void *)CFPreferencesCopyValue(@"PPSVersion", @"com.apple.security.smartcard", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardsNeedsBaseFiDi, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_lastATR, 0);
  objc_storeStrong((id *)&self->_pipeOut, 0);

  objc_storeStrong((id *)&self->_pipeIn, 0);
}

@end