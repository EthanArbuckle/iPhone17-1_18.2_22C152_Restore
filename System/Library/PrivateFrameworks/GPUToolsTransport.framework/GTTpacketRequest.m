@interface GTTpacketRequest
+ (BOOL)supportsSecureCoding;
- (GTTpacketRequest)initWithCoder:(id)a3;
- (NSArray)requests;
- (NSString)label;
- (NSString)selector;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRequestID:(unint64_t)a3;
- (void)setRequests:(id)a3;
- (void)setSelector:(id)a3;
@end

@implementation GTTpacketRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  selector = self->_selector;
  id v5 = a3;
  [v5 encodeObject:selector forKey:@"selector"];
  [v5 encodeObject:self->_requests forKey:@"request"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeInt64:self->_requestID forKey:@"requestID"];
}

- (GTTpacketRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTTpacketRequest;
  id v5 = [(GTTpacketRequest *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selector"];
    selector = v5->_selector;
    v5->_selector = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;

    v5->_requestID = [v4 decodeInt64ForKey:@"requestID"];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"request"];
    requests = v5->_requests;
    v5->_requests = (NSArray *)v13;
  }
  return v5;
}

- (NSString)selector
{
  return self->_selector;
}

- (void)setSelector:(id)a3
{
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

@end