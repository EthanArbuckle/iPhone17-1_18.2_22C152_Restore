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
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRReaderRequest.m", 171, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_readerRequest forKey:@"ReaderRequest"];
  [a3 encodeBool:self->_bypassHoldingPeriod forKey:@"BypassHoldingPeriod"];
  [a3 encodeDouble:@"From" forKey:self->_from];
  [a3 encodeDouble:@"To" forKey:self->_to];
  cursor = self->_cursor;

  [a3 encodeObject:cursor forKey:@"Cursor"];
}

- (SRReaderFetchRequest)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRReaderRequest.m", 180, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  v10.receiver = self;
  v10.super_class = (Class)SRReaderFetchRequest;
  v6 = [(SRReaderFetchRequest *)&v10 init];
  if (v6)
  {
    v6->_readerRequest = (SRRequestReading *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"ReaderRequest"];
    v6->_bypassHoldingPeriod = [a3 decodeBoolForKey:@"BypassHoldingPeriod"];
    [a3 decodeDoubleForKey:@"From"];
    v6->_from = v7;
    [a3 decodeDoubleForKey:@"To"];
    v6->_to = v8;
    v6->_cursor = (SRCursor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Cursor"];
  }
  return v6;
}

- (NSString)description
{
  objc_super v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p): from: %f, to: %f, cursor: %@, %@", NSStringFromClass(v4), self, *(void *)&self->_from, *(void *)&self->_to, self->_cursor, self->_readerRequest];
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