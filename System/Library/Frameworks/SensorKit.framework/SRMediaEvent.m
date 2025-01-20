@interface SRMediaEvent
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)mediaIdentifier;
- (SRMediaEvent)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRMediaEvent)initWithCoder:(id)a3;
- (SRMediaEvent)initWithMediaIdentifier:(id)a3 eventType:(int64_t)a4;
- (SRMediaEventType)eventType;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setMediaIdentifier:(id)a3;
@end

@implementation SRMediaEvent

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogMediaEvent = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogMediaEvent");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRMediaEvent)initWithMediaIdentifier:(id)a3 eventType:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SRMediaEvent;
  v6 = [(SRMediaEvent *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_eventType = a4;
    v6->_mediaIdentifier = (NSString *)[a3 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRMediaEvent;
  [(SRMediaEvent *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRMediaEvent.m", 51, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRMediaEvent eventType](self, "eventType"), @"eventType");
  v6 = [(SRMediaEvent *)self mediaIdentifier];

  [a3 encodeObject:v6 forKey:@"mediaIdentifier"];
}

- (SRMediaEvent)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRMediaEvent.m", 57, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeIntegerForKey:@"eventType"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaIdentifier"];
  uint64_t v8 = v7;
  if (v6 && v7)
  {

    objc_super v9 = objc_alloc_init(SRMediaEvent);
    [(SRMediaEvent *)v9 setEventType:v6];
    [(SRMediaEvent *)v9 setMediaIdentifier:v8];
  }
  else
  {
    v10 = SRLogMediaEvent;
    if (os_log_type_enabled((os_log_t)SRLogMediaEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      _os_log_error_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_ERROR, "Failed to encode the object. Media identifier:%@, event type:%ld", buf, 0x16u);
    }
    return 0;
  }
  return v9;
}

- (id)binarySampleRepresentation
{
  uint64_t v3 = 0;
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v3];
}

- (SRMediaEvent)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRMediaEvent;
    result = [(SRMediaEvent *)&v11 init];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v10 = 0;
      result = (SRMediaEvent *)[MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v10];
      if (result)
      {
        objc_super v9 = result;

        return v9;
      }
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p) {media identifier: %@, event type: %ld}", NSStringFromClass(v4), self, -[SRMediaEvent mediaIdentifier](self, "mediaIdentifier"), -[SRMediaEvent eventType](self, "eventType")];
}

- (id)sr_dictionaryRepresentation
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"mediaIdentifier";
  v4[1] = @"eventType";
  v5[0] = [(SRMediaEvent *)self mediaIdentifier];
  v5[1] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRMediaEvent eventType](self, "eventType"));
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = -[NSString isEqual:](-[SRMediaEvent mediaIdentifier](self, "mediaIdentifier"), "isEqual:", [a3 mediaIdentifier]);
      if (v5)
      {
        SRMediaEventType v6 = [(SRMediaEvent *)self eventType];
        LOBYTE(v5) = v6 == [a3 eventType];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_eventType ^ [(NSString *)self->_mediaIdentifier hash];
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (void)setMediaIdentifier:(id)a3
{
}

- (SRMediaEventType)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

@end