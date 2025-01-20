@interface CTStewieTransportMessage
+ (BOOL)supportsSecureCoding;
+ (id)allowedSetOfClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransportMessage:(id)a3;
- (CTStewieTransportMessage)init;
- (CTStewieTransportMessage)initWithCoder:(id)a3;
- (CTStewieTransportMessage)initWithMsgId:(id)a3;
- (NSData)data;
- (NSDictionary)metadata;
- (NSString)msgId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMsgId:(id)a3;
@end

@implementation CTStewieTransportMessage

- (CTStewieTransportMessage)init
{
  v10.receiver = self;
  v10.super_class = (Class)CTStewieTransportMessage;
  v2 = [(CTStewieTransportMessage *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    msgId = v2->_msgId;
    v2->_msgId = (NSString *)v4;

    data = v2->_data;
    v2->_data = 0;

    metadata = v2->_metadata;
    v2->_metadata = 0;

    v8 = v2;
  }

  return v2;
}

- (CTStewieTransportMessage)initWithMsgId:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTStewieTransportMessage;
  v6 = [(CTStewieTransportMessage *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_msgId, a3);
    data = v7->_data;
    v7->_data = 0;

    metadata = v7->_metadata;
    v7->_metadata = 0;

    objc_super v10 = v7;
  }

  return v7;
}

- (id)description
{
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v5 = [(CTStewieTransportMessage *)self msgId];
  [v4 appendFormat:@", msgId=%@", v5];

  v6 = [(CTStewieTransportMessage *)self data];
  if (v6)
  {
    v2 = [(CTStewieTransportMessage *)self data];
    uint64_t v7 = [v2 length];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v4 appendFormat:@", data length=%lu", v7];
  if (v6) {

  }
  v8 = [(CTStewieTransportMessage *)self metadata];
  [v4 appendFormat:@", metadata=%@", v8];

  [v4 appendString:@">"];

  return v4;
}

- (BOOL)isEqualToTransportMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CTStewieTransportMessage *)self msgId];
  v6 = [v4 msgId];
  if (v5 != v6)
  {
    v18 = [(CTStewieTransportMessage *)self msgId];
    v16 = [v4 msgId];
    if (!objc_msgSend(v18, "isEqual:"))
    {
      char v7 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v8 = [(CTStewieTransportMessage *)self data];
  v9 = [v4 data];
  if (v8 != v9)
  {
    v17 = [(CTStewieTransportMessage *)self data];
    v15 = [v4 data];
    if (!objc_msgSend(v17, "isEqual:"))
    {
      char v7 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  objc_super v10 = [(CTStewieTransportMessage *)self metadata];
  v11 = [v4 metadata];
  if (v10 == v11)
  {

    char v7 = 1;
  }
  else
  {
    objc_super v12 = [(CTStewieTransportMessage *)self metadata];
    v13 = [v4 metadata];
    char v7 = [v12 isEqual:v13];
  }
  if (v8 != v9) {
    goto LABEL_11;
  }
LABEL_12:

  if (v5 != v6) {
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieTransportMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieTransportMessage *)self isEqualToTransportMessage:v4];
  }

  return v5;
}

+ (id)allowedSetOfClasses
{
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(CTStewieTransportMessage *)self msgId];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setMsgId:v7];

  uint64_t v8 = [(CTStewieTransportMessage *)self data];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setData:v9];

  uint64_t v10 = [(CTStewieTransportMessage *)self metadata];
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setMetadata:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(CTStewieTransportMessage *)self msgId];
  [v7 encodeObject:v4 forKey:@"msgId"];

  uint64_t v5 = [(CTStewieTransportMessage *)self data];
  [v7 encodeObject:v5 forKey:@"data"];

  uint64_t v6 = [(CTStewieTransportMessage *)self metadata];
  [v7 encodeObject:v6 forKey:@"metadata"];
}

- (CTStewieTransportMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CTStewieTransportMessage;
  uint64_t v5 = [(CTStewieTransportMessage *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"msgId"];
    msgId = v5->_msgId;
    v5->_msgId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v17;

    uint64_t v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)msgId
{
  return self->_msgId;
}

- (void)setMsgId:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_msgId, 0);
}

@end