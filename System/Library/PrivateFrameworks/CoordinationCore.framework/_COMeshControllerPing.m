@interface _COMeshControllerPing
+ (BOOL)supportsSecureCoding;
+ (id)acceptableResponses;
- (_COMeshControllerPing)initWithCoder:(id)a3;
- (_COMeshControllerPing)initWithTimeout:(double)a3;
- (_COMeshControllerPing)initWithTimeout:(double)a3 listeningPort:(int)a4;
- (double)responseTimeout;
- (int)listeningPort;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _COMeshControllerPing

- (_COMeshControllerPing)initWithTimeout:(double)a3 listeningPort:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_COMeshControllerPing;
  result = [(COMeshCommand *)&v7 init];
  if (result)
  {
    result->_responseTimeout = a3;
    result->_listeningPort = a4;
  }
  return result;
}

- (_COMeshControllerPing)initWithTimeout:(double)a3
{
  return [(_COMeshControllerPing *)self initWithTimeout:0 listeningPort:a3];
}

- (_COMeshControllerPing)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_COMeshControllerPing;
  v5 = [(COMeshCommand *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_listeningPort = [v4 decodeInt32ForKey:@"listeningPort"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_COMeshControllerPing;
  [(COMeshCommand *)&v5 encodeWithCoder:v4];
  if (self->_listeningPort >= 1) {
    objc_msgSend(v4, "encodeInt32:forKey:");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  return v2;
}

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (int)listeningPort
{
  return self->_listeningPort;
}

@end