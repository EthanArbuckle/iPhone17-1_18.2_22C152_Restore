@interface CWFRangingMeasurement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRangingMeasurement:(id)a3;
- (CWFRangingMeasurement)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)RSSI;
- (int64_t)SNR;
- (int64_t)roundTripTime;
- (unint64_t)channel;
- (unint64_t)coreID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(unint64_t)a3;
- (void)setCoreID:(unint64_t)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setRoundTripTime:(int64_t)a3;
- (void)setSNR:(int64_t)a3;
@end

@implementation CWFRangingMeasurement

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"rtt=%ld rssi=%ld snr=%ld channel=%lu coreid=%lu", v2, v3, self->_roundTripTime, self->_RSSI, self->_SNR, self->_channel, self->_coreID);
}

- (BOOL)isEqualToRangingMeasurement:(id)a3
{
  id v4 = a3;
  int64_t roundTripTime = self->_roundTripTime;
  if (roundTripTime == objc_msgSend_roundTripTime(v4, v6, v7, v8, v9)
    && (unint64_t channel = self->_channel, channel == objc_msgSend_channel(v4, v10, v11, v12, v13))
    && (int64_t RSSI = self->_RSSI, RSSI == objc_msgSend_RSSI(v4, v15, v16, v17, v18))
    && (int64_t SNR = self->_SNR, SNR == objc_msgSend_SNR(v4, v20, v21, v22, v23)))
  {
    unint64_t coreID = self->_coreID;
    BOOL v30 = coreID == objc_msgSend_coreID(v4, v25, v26, v27, v28);
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFRangingMeasurement *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToRangingMeasurement = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToRangingMeasurement = objc_msgSend_isEqualToRangingMeasurement_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToRangingMeasurement = 0;
  }

  return isEqualToRangingMeasurement;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_numberWithInteger_(NSNumber, a2, self->_roundTripTime, v2, v3);
  unint64_t v10 = self->_channel ^ objc_msgSend_hash(v5, v6, v7, v8, v9);
  v14 = objc_msgSend_numberWithInteger_(NSNumber, v11, self->_RSSI, v12, v13);
  uint64_t v19 = objc_msgSend_hash(v14, v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_numberWithInteger_(NSNumber, v20, self->_SNR, v21, v22);
  unint64_t v28 = v10 ^ v19 ^ objc_msgSend_hash(v23, v24, v25, v26, v27) ^ self->_coreID;

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_allocWithZone_(CWFRangingMeasurement, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setRoundTripTime_(v11, v12, self->_roundTripTime, v13, v14);
  objc_msgSend_setRSSI_(v11, v15, self->_RSSI, v16, v17);
  objc_msgSend_setChannel_(v11, v18, self->_channel, v19, v20);
  objc_msgSend_setSNR_(v11, v21, self->_SNR, v22, v23);
  objc_msgSend_setCoreID_(v11, v24, self->_coreID, v25, v26);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  int64_t roundTripTime = self->_roundTripTime;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_numberWithInteger_(v4, v7, roundTripTime, v8, v9);
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v10, @"_roundTripTime", v12);

  objc_msgSend_encodeInteger_forKey_(v6, v13, self->_RSSI, @"_RSSI", v14);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, self->_channel, v16, v17);
  objc_msgSend_encodeObject_forKey_(v6, v19, (uint64_t)v18, @"_channel", v20);

  v24 = objc_msgSend_numberWithInteger_(NSNumber, v21, self->_SNR, v22, v23);
  objc_msgSend_encodeObject_forKey_(v6, v25, (uint64_t)v24, @"_SNR", v26);

  objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, self->_coreID, v28, v29);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v30, (uint64_t)v32, @"_coreID", v31);
}

- (CWFRangingMeasurement)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CWFRangingMeasurement;
  v5 = [(CWFRangingMeasurement *)&v37 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_roundTripTime", v8);
    v5->_int64_t roundTripTime = objc_msgSend_integerValue(v9, v10, v11, v12, v13);

    v5->_int64_t RSSI = objc_msgSend_decodeIntegerForKey_(v4, v14, @"_RSSI", v15, v16);
    uint64_t v17 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"_channel", v19);
    v5->_unint64_t channel = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23, v24);

    v5->_int64_t SNR = objc_msgSend_decodeIntegerForKey_(v4, v25, @"_SNR", v26, v27);
    uint64_t v28 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"_coreID", v30);
    v5->_unint64_t coreID = objc_msgSend_unsignedIntegerValue(v31, v32, v33, v34, v35);
  }
  return v5;
}

- (int64_t)roundTripTime
{
  return self->_roundTripTime;
}

- (void)setRoundTripTime:(int64_t)a3
{
  self->_int64_t roundTripTime = a3;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_int64_t RSSI = a3;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_unint64_t channel = a3;
}

- (int64_t)SNR
{
  return self->_SNR;
}

- (void)setSNR:(int64_t)a3
{
  self->_int64_t SNR = a3;
}

- (unint64_t)coreID
{
  return self->_coreID;
}

- (void)setCoreID:(unint64_t)a3
{
  self->_unint64_t coreID = a3;
}

@end