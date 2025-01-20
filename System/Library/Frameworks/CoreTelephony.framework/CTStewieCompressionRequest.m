@interface CTStewieCompressionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTStewieCompressionRequest)initWithCoder:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CTStewieCompressionRequest

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieCompressionRequest *)self data];

  if (v4)
  {
    v5 = [(CTStewieCompressionRequest *)self data];
    [v3 appendFormat:@", data length=%lu", objc_msgSend(v5, "length")];
  }
  else
  {
    [v3 appendFormat:@", data=nil"];
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CTStewieCompressionRequest *)a3;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(CTStewieCompressionRequest *)self data];
      if (v7
        || ([(CTStewieCompressionRequest *)v6 data], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = [(CTStewieCompressionRequest *)self data];
        v9 = [(CTStewieCompressionRequest *)v6 data];
        char v10 = [v8 isEqual:v9];

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char v10 = 1;
      }

      goto LABEL_11;
    }
    char v10 = 0;
  }
LABEL_12:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTStewieCompressionRequest *)self data];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setData:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTStewieCompressionRequest *)self data];
  [v5 encodeObject:v4 forKey:@"data"];
}

- (CTStewieCompressionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieCompressionRequest;
  id v5 = [(CTStewieCompressionRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end