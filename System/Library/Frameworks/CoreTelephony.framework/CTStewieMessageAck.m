@interface CTStewieMessageAck
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessageAck:(id)a3;
- (BOOL)success;
- (CTStewieMessageAck)init;
- (CTStewieMessageAck)initWithCoder:(id)a3;
- (CTStewieMessageAck)initWithError:(id)a3;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)transportType;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTransportType:(int64_t)a3;
@end

@implementation CTStewieMessageAck

- (CTStewieMessageAck)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTStewieMessageAck;
  v2 = [(CTStewieMessageAck *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_success = 0;
    error = v2->_error;
    v2->_error = 0;

    v3->_transportType = 0;
    v5 = v3;
  }

  return v3;
}

- (CTStewieMessageAck)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieMessageAck;
  v6 = [(CTStewieMessageAck *)&v10 init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_success = 0;
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_transportType = 0;
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTStewieMessageAck *)self success];
  id v5 = @"NO";
  if (v4) {
    id v5 = @"YES";
  }
  [v3 appendFormat:@", success=%@", v5];
  v6 = [(CTStewieMessageAck *)self error];
  [v3 appendFormat:@", error=%@", v6];

  [v3 appendFormat:@", transportType=%s", CTStewieTransportTypeAsString(-[CTStewieMessageAck transportType](self, "transportType"))];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToMessageAck:(id)a3
{
  id v6 = a3;
  int v7 = [(CTStewieMessageAck *)self success];
  if (v7 == [v6 success])
  {
    v9 = [(CTStewieMessageAck *)self error];
    objc_super v10 = [v6 error];
    if (v9 == v10
      || ([(CTStewieMessageAck *)self error],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 error],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int64_t v11 = [(CTStewieMessageAck *)self transportType];
      BOOL v8 = v11 == [v6 transportType];
      if (v9 == v10)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v8 = 0;
    }

    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (CTStewieMessageAck *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieMessageAck *)self isEqualToMessageAck:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSuccess:", -[CTStewieMessageAck success](self, "success"));
  id v6 = [(CTStewieMessageAck *)self error];
  int v7 = (void *)[v6 copyWithZone:a3];
  [v5 setError:v7];

  objc_msgSend(v5, "setTransportType:", -[CTStewieMessageAck transportType](self, "transportType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieMessageAck success](self, "success"), @"success");
  BOOL v4 = [(CTStewieMessageAck *)self error];
  [v5 encodeObject:v4 forKey:@"error"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieMessageAck transportType](self, "transportType"), @"transportType");
}

- (CTStewieMessageAck)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieMessageAck;
  id v5 = [(CTStewieMessageAck *)&v10 init];
  if (v5)
  {
    v5->_success = [v4 decodeBoolForKey:@"success"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_transportType = [v4 decodeIntegerForKey:@"transportType"];
    BOOL v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
}

@end