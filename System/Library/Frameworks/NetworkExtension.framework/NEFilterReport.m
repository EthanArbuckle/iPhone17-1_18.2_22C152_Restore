@interface NEFilterReport
+ (BOOL)supportsSecureCoding;
- (NEFilterAction)action;
- (NEFilterFlow)flow;
- (NEFilterReport)init;
- (NEFilterReport)initWithCoder:(id)a3;
- (NEFilterReportEvent)event;
- (NSUInteger)bytesInboundCount;
- (NSUInteger)bytesOutboundCount;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithFlow:(uint64_t)a3 action:(uint64_t)a4 event:;
- (void)setAction:(int64_t)a3;
- (void)setBytesInboundCount:(unint64_t)a3;
- (void)setBytesOutboundCount:(unint64_t)a3;
- (void)setFlow:(id)a3;
@end

@implementation NEFilterReport

- (void).cxx_destruct
{
}

- (void)setBytesOutboundCount:(unint64_t)a3
{
  self->_bytesOutboundCount = a3;
}

- (NSUInteger)bytesOutboundCount
{
  return self->_bytesOutboundCount;
}

- (void)setBytesInboundCount:(unint64_t)a3
{
  self->_bytesInboundCount = a3;
}

- (NSUInteger)bytesInboundCount
{
  return self->_bytesInboundCount;
}

- (NEFilterReportEvent)event
{
  return self->_event;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NEFilterAction)action
{
  return self->_action;
}

- (void)setFlow:(id)a3
{
}

- (NEFilterFlow)flow
{
  return (NEFilterFlow *)objc_getProperty(self, a2, 8, 1);
}

- (NEFilterReport)init
{
  return (NEFilterReport *)-[NEFilterReport initWithFlow:action:event:](self, 0, 0, 0);
}

- (void)initWithFlow:(uint64_t)a3 action:(uint64_t)a4 event:
{
  id v7 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)NEFilterReport;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      [v8 setFlow:v7];
      [a1 setAction:a3];
      a1[3] = a4;
      a1[4] = [v7 inBytes];
      a1[5] = [v7 outBytes];
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NEFilterReport *)self flow];
  [v4 setFlow:v5];

  objc_msgSend(v4, "setAction:", -[NEFilterReport action](self, "action"));
  objc_msgSend(v4, "setBytesInboundCount:", -[NEFilterReport bytesInboundCount](self, "bytesInboundCount"));
  objc_msgSend(v4, "setBytesOutboundCount:", -[NEFilterReport bytesOutboundCount](self, "bytesOutboundCount"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(NEFilterReport *)self flow];
  [v5 encodeObject:v4 forKey:@"kNEFilterReportFlow"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport action](self, "action"), @"kNEFilterReportAction");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport event](self, "event"), @"reportEvent");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport bytesInboundCount](self, "bytesInboundCount"), @"bytesInboundCount");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport bytesOutboundCount](self, "bytesOutboundCount"), @"bytesOutboundCount");
}

- (NEFilterReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEFilterReport;
  id v5 = [(NEFilterReport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNEFilterReportFlow"];
    flow = v5->_flow;
    v5->_flow = (NEFilterFlow *)v6;

    v5->_action = [v4 decodeIntegerForKey:@"kNEFilterReportAction"];
    v5->_event = [v4 decodeIntegerForKey:@"reportEvent"];
    v5->_bytesInboundCount = [v4 decodeIntegerForKey:@"bytesInboundCount"];
    v5->_bytesOutboundCount = [v4 decodeIntegerForKey:@"bytesOutboundCount"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end