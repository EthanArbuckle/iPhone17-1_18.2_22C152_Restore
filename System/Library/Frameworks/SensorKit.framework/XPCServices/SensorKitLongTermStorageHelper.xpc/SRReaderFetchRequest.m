@interface SRReaderFetchRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)bypassHoldingPeriod;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)sensor;
- (SRCursor)cursor;
- (SRReaderFetchRequest)init;
- (SRReaderFetchRequest)initWithCoder:(id)a3;
- (double)from;
- (double)to;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBypassHoldingPeriod:(BOOL)a3;
- (void)setCursor:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFrom:(double)a3;
- (void)setSensor:(id)a3;
- (void)setTo:(double)a3;
@end

@implementation SRReaderFetchRequest

- (SRReaderFetchRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)SRReaderFetchRequest;
  v2 = [(SRReaderFetchRequest *)&v4 init];
  if (v2) {
    v2->_readerRequest = (SRRequestReading *)objc_alloc_init(SRReaderRequest);
  }
  return v2;
}

- (void)dealloc
{
  self->_readerRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRReaderFetchRequest;
  [(SRReaderFetchRequest *)&v3 dealloc];
}

- (NSString)sensor
{
  return (NSString *)[(SRRequestReading *)self->_readerRequest sensor];
}

- (void)setSensor:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(SRRequestReading *)self->_readerRequest bundleIdentifier];
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return (NSString *)[(SRRequestReading *)self->_readerRequest deviceIdentifier];
}

- (void)setDeviceIdentifier:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_readerRequest forKey:@"ReaderRequest"];
  [a3 encodeBool:self->_bypassHoldingPeriod forKey:@"BypassHoldingPeriod"];
  [a3 encodeDouble:@"From" forKey:self->_from];
  [a3 encodeDouble:@"To" forKey:self->_to];
  cursor = self->_cursor;

  [a3 encodeObject:cursor forKey:@"Cursor"];
}

- (SRReaderFetchRequest)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SRReaderFetchRequest;
  objc_super v4 = [(SRReaderFetchRequest *)&v8 init];
  if (v4)
  {
    v4->_readerRequest = (SRRequestReading *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"ReaderRequest"];
    v4->_bypassHoldingPeriod = [a3 decodeBoolForKey:@"BypassHoldingPeriod"];
    [a3 decodeDoubleForKey:@"From"];
    v4->_from = v5;
    [a3 decodeDoubleForKey:@"To"];
    v4->_to = v6;
    v4->_cursor = (SRCursor *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Cursor"];
  }
  return v4;
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@ (%p): from: %f, to: %f, cursor: %@, %@", NSStringFromClass(v3), self, *(void *)&self->_from, *(void *)&self->_to, self->_cursor, self->_readerRequest];
}

- (double)from
{
  return self->_from;
}

- (void)setFrom:(double)a3
{
  self->_from = a3;
}

- (double)to
{
  return self->_to;
}

- (void)setTo:(double)a3
{
  self->_to = a3;
}

- (BOOL)bypassHoldingPeriod
{
  return self->_bypassHoldingPeriod;
}

- (void)setBypassHoldingPeriod:(BOOL)a3
{
  self->_bypassHoldingPeriod = a3;
}

- (SRCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

@end