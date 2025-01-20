@interface APFrequencyCapData
+ (BOOL)supportsSecureCoding;
- (APFrequencyCapData)initWithCoder:(id)a3;
- (int64_t)relevantIdentifier;
- (unint64_t)duration;
- (unint64_t)value;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setRelevantIdentifier:(int64_t)a3;
- (void)setValue:(unint64_t)a3;
@end

@implementation APFrequencyCapData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APFrequencyCapData)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)APFrequencyCapData;
  v8 = [(APFrequencyCapData *)&v22 init];
  if (v8)
  {
    v8->_relevantIdentifier = (int)objc_msgSend_decodeIntForKey_(v4, v5, @"relevantIdentifier", v6, v7, v9, v10);
    v8->_value = (int)objc_msgSend_decodeIntForKey_(v4, v11, @"frequencyValue", v12, v13, v14, v15);
    v8->_duration = (int)objc_msgSend_decodeIntForKey_(v4, v16, @"frequencyDuration", v17, v18, v19, v20);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t relevantIdentifier_low = LODWORD(self->_relevantIdentifier);
  id v17 = a3;
  objc_msgSend_encodeInt_forKey_(v17, v5, relevantIdentifier_low, @"relevantIdentifier", v6, v7, v8);
  objc_msgSend_encodeInt_forKey_(v17, v9, LODWORD(self->_value), @"frequencyValue", v10, v11, v12);
  objc_msgSend_encodeInt_forKey_(v17, v13, LODWORD(self->_duration), @"frequencyDuration", v14, v15, v16);
}

- (int64_t)relevantIdentifier
{
  return self->_relevantIdentifier;
}

- (void)setRelevantIdentifier:(int64_t)a3
{
  self->_relevantIdentifier = a3;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

@end