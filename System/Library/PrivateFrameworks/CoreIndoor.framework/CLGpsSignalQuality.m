@interface CLGpsSignalQuality
+ (BOOL)supportsSecureCoding;
- (CLGpsSignalQuality)init;
- (CLGpsSignalQuality)initWithCoder:(id)a3;
- (CLGpsSignalQuality)initWithSignalQuality:(int)a3;
- (int)quality;
- (void)encodeWithCoder:(id)a3;
- (void)setQuality:(int)a3;
@end

@implementation CLGpsSignalQuality

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLGpsSignalQuality)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLGpsSignalQuality)initWithSignalQuality:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLGpsSignalQuality;
  v4 = [(CLGpsSignalQuality *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_quality = a3;
    v6 = v4;
  }

  return v5;
}

- (CLGpsSignalQuality)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLGpsSignalQuality;
  objc_super v8 = [(CLGpsSignalQuality *)&v11 init];
  if (v8)
  {
    v8->_quality = objc_msgSend_decodeIntForKey_(v4, v5, @"signalQuality", v6, v7);
    v9 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt_forKey_(a3, a2, self->_quality, @"signalQuality", v3);
}

- (int)quality
{
  return self->_quality;
}

- (void)setQuality:(int)a3
{
  self->_quality = a3;
}

@end