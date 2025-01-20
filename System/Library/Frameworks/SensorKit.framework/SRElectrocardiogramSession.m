@interface SRElectrocardiogramSession
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSession:(id)a3;
- (NSString)identifier;
- (SRElectrocardiogramSession)init;
- (SRElectrocardiogramSession)initWithCoder:(id)a3;
- (SRElectrocardiogramSession)initWithState:(int64_t)a3 sessionGuidance:(int64_t)a4 identifier:(id)a5;
- (id)description;
- (int64_t)sessionGuidance;
- (int64_t)state;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRElectrocardiogramSession

- (SRElectrocardiogramSession)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (SRElectrocardiogramSession)initWithState:(int64_t)a3 sessionGuidance:(int64_t)a4 identifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SRElectrocardiogramSession;
  v8 = [(SRElectrocardiogramSession *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    v8->_sessionGuidance = a4;
    v8->_identifier = (NSString *)[a5 copy];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRElectrocardiogramSession;
  [(SRElectrocardiogramSession *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(SRElectrocardiogramSession *)self isEqualToSession:a3];
}

- (BOOL)isEqualToSession:(id)a3
{
  if (!-[SRElectrocardiogramSession identifier](self, "identifier") && ![a3 identifier]
    || (int v5 = -[NSString isEqual:](-[SRElectrocardiogramSession identifier](self, "identifier"), "isEqual:", [a3 identifier])) != 0)
  {
    int64_t state = self->_state;
    if (state == [a3 state])
    {
      int64_t sessionGuidance = self->_sessionGuidance;
      LOBYTE(v5) = sessionGuidance == [a3 sessionGuidance];
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
  uint64_t v3 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_state), "hash");
  uint64_t v4 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_sessionGuidance), "hash") ^ v3;
  return v4 ^ [(NSString *)self->_identifier hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p): state: %ld, guidance: %ld, identifier: %@", NSStringFromClass(v4), self, self->_state, self->_sessionGuidance, self->_identifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRElectrocardiogramSession.m", 89, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeInteger:self->_state forKey:@"state"];
  [a3 encodeInteger:self->_sessionGuidance forKey:@"sessionGuidance"];
  identifier = self->_identifier;

  [a3 encodeObject:identifier forKey:@"identifier"];
}

- (SRElectrocardiogramSession)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRElectrocardiogramSession.m", 96, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v7 = [a3 decodeIntegerForKey:@"sessionGuidance"];
  uint64_t v8 = [a3 decodeIntegerForKey:@"state"];

  return [(SRElectrocardiogramSession *)self initWithState:v8 sessionGuidance:v7 identifier:v6];
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)sessionGuidance
{
  return self->_sessionGuidance;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end