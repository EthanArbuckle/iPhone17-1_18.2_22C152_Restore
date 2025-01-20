@interface SRTextInputSession
+ (BOOL)supportsSecureCoding;
+ (SRTextInputSession)textInputSessionWithDuration:(double)a3 sessionType:(int64_t)a4 sessionIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)sessionIdentifier;
- (NSTimeInterval)duration;
- (SRTextInputSession)initWithCoder:(id)a3;
- (SRTextInputSessionType)sessionType;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSessionType:(int64_t)a3;
@end

@implementation SRTextInputSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 301, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [(SRTextInputSession *)self duration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"duration");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRTextInputSession sessionType](self, "sessionType"), @"textInputSessionType");
  v6 = [(SRTextInputSession *)self sessionIdentifier];

  [a3 encodeObject:v6 forKey:@"sessionIdentifier"];
}

- (SRTextInputSession)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 308, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }

  v6 = objc_alloc_init(SRTextInputSession);
  [a3 decodeDoubleForKey:@"duration"];
  -[SRTextInputSession setDuration:](v6, "setDuration:");
  -[SRTextInputSession setSessionType:](v6, "setSessionType:", [a3 decodeIntegerForKey:@"textInputSessionType"]);
  -[SRTextInputSession setSessionIdentifier:](v6, "setSessionIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"]);
  return v6;
}

+ (SRTextInputSession)textInputSessionWithDuration:(double)a3 sessionType:(int64_t)a4 sessionIdentifier:(id)a5
{
  v8 = objc_alloc_init(SRTextInputSession);
  [(SRTextInputSession *)v8 setDuration:a3];
  [(SRTextInputSession *)v8 setSessionType:a4];
  [(SRTextInputSession *)v8 setSessionIdentifier:a5];

  return v8;
}

- (NSString)sessionIdentifier
{
  if (self->_sessionIdentifier) {
    return self->_sessionIdentifier;
  }
  else {
    return (NSString *)&stru_26D165EC8;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRTextInputSession;
  [(SRTextInputSession *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(SRTextInputSession *)self duration];
  double v6 = v5;
  [a3 duration];
  if (v6 != v7) {
    return 0;
  }
  SRTextInputSessionType v8 = [(SRTextInputSession *)self sessionType];
  if (v8 != [a3 sessionType]) {
    return 0;
  }
  v9 = [(SRTextInputSession *)self sessionIdentifier];
  uint64_t v10 = [a3 sessionIdentifier];

  return [(NSString *)v9 isEqual:v10];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(SRTextInputSession *)self duration];
  return (NSString *)[v3 stringWithFormat:@"%@ {duration: %f, session type: %ld, session identifier:%@}", v5, v6, -[SRTextInputSession sessionType](self, "sessionType"), -[SRTextInputSession sessionIdentifier](self, "sessionIdentifier")];
}

- (id)sr_dictionaryRepresentation
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"duration";
  objc_super v3 = NSNumber;
  [(SRTextInputSession *)self duration];
  v6[0] = objc_msgSend(v3, "numberWithDouble:");
  v5[1] = @"textInputSessionType";
  v6[1] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRTextInputSession sessionType](self, "sessionType"));
  v5[2] = @"sessionIdentifier";
  v6[2] = [(SRTextInputSession *)self sessionIdentifier];
  return (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (SRTextInputSessionType)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (void)setSessionIdentifier:(id)a3
{
}

@end