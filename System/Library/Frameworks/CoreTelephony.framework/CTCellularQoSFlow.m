@interface CTCellularQoSFlow
+ (BOOL)supportsSecureCoding;
- (CTCellularQoSFlow)initWithCoder:(id)a3;
- (CTQoS)rxQos;
- (CTQoS)txQos;
- (NSNumber)is5G;
- (NSNumber)queueSetId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)bearerId;
- (unint64_t)flowId;
- (void)encodeWithCoder:(id)a3;
- (void)setBearerId:(unint64_t)a3;
- (void)setFlowId:(unint64_t)a3;
- (void)setIs5G:(id)a3;
- (void)setQueueSetId:(id)a3;
- (void)setRxQos:(id)a3;
- (void)setTxQos:(id)a3;
@end

@implementation CTCellularQoSFlow

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", flowId=%lu", -[CTCellularQoSFlow flowId](self, "flowId")];
  [v3 appendFormat:@", bearerId=%lu", -[CTCellularQoSFlow bearerId](self, "bearerId")];
  v4 = [(CTCellularQoSFlow *)self queueSetId];

  if (v4)
  {
    v5 = [(CTCellularQoSFlow *)self queueSetId];
    [v3 appendFormat:@", queueSetId=%@", v5];
  }
  v6 = [(CTCellularQoSFlow *)self is5G];

  if (v6)
  {
    v7 = [(CTCellularQoSFlow *)self is5G];
    int v8 = [v7 BOOLValue];

    if (v8) {
      [v3 appendFormat:@", is5G=true"];
    }
  }
  v9 = [(CTCellularQoSFlow *)self txQos];

  if (v9)
  {
    v10 = [(CTCellularQoSFlow *)self txQos];
    [v3 appendFormat:@", txQos=%@", v10];
  }
  v11 = [(CTCellularQoSFlow *)self rxQos];

  if (v11)
  {
    v12 = [(CTCellularQoSFlow *)self rxQos];
    [v3 appendFormat:@", rxQos=%@", v12];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFlowId:", -[CTCellularQoSFlow flowId](self, "flowId"));
  objc_msgSend(v4, "setBearerId:", -[CTCellularQoSFlow bearerId](self, "bearerId"));
  v5 = [(CTCellularQoSFlow *)self queueSetId];

  if (v5)
  {
    v6 = [(CTCellularQoSFlow *)self queueSetId];
    v7 = (void *)[v6 copy];
    [v4 setQueueSetId:v7];
  }
  int v8 = [(CTCellularQoSFlow *)self is5G];

  if (v8)
  {
    v9 = [(CTCellularQoSFlow *)self is5G];
    v10 = (void *)[v9 copy];
    [v4 setIs5G:v10];
  }
  else
  {
    [v4 setQueueSetId:0];
  }
  v11 = [(CTCellularQoSFlow *)self txQos];
  v12 = (void *)[v11 copy];
  [v4 setTxQos:v12];

  v13 = [(CTCellularQoSFlow *)self rxQos];
  v14 = (void *)[v13 copy];
  [v4 setRxQos:v14];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CTCellularQoSFlow flowId](self, "flowId"), @"flowId");
  objc_msgSend(v4, "encodeInt64:forKey:", -[CTCellularQoSFlow bearerId](self, "bearerId"), @"bearerId");
  v5 = [(CTCellularQoSFlow *)self queueSetId];
  [v4 encodeObject:v5 forKey:@"queueSetId"];

  v6 = [(CTCellularQoSFlow *)self is5G];
  [v4 encodeObject:v6 forKey:@"is5G"];

  v7 = [(CTCellularQoSFlow *)self txQos];
  [v4 encodeObject:v7 forKey:@"txQos"];

  id v8 = [(CTCellularQoSFlow *)self rxQos];
  [v4 encodeObject:v8 forKey:@"rxQos"];
}

- (CTCellularQoSFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCellularQoSFlow;
  v5 = [(CTCellularQoSFlow *)&v15 init];
  if (v5)
  {
    v5->_flowId = [v4 decodeInt64ForKey:@"flowId"];
    v5->_bearerId = [v4 decodeInt64ForKey:@"bearerId"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queueSetId"];
    queueSetId = v5->_queueSetId;
    v5->_queueSetId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"is5G"];
    is5G = v5->_is5G;
    v5->_is5G = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"txQos"];
    txQos = v5->_txQos;
    v5->_txQos = (CTQoS *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rxQos"];
    rxQos = v5->_rxQos;
    v5->_rxQos = (CTQoS *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(unint64_t)a3
{
  self->_flowId = a3;
}

- (unint64_t)bearerId
{
  return self->_bearerId;
}

- (void)setBearerId:(unint64_t)a3
{
  self->_bearerId = a3;
}

- (NSNumber)queueSetId
{
  return self->_queueSetId;
}

- (void)setQueueSetId:(id)a3
{
}

- (NSNumber)is5G
{
  return self->_is5G;
}

- (void)setIs5G:(id)a3
{
}

- (CTQoS)txQos
{
  return self->_txQos;
}

- (void)setTxQos:(id)a3
{
}

- (CTQoS)rxQos
{
  return self->_rxQos;
}

- (void)setRxQos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxQos, 0);
  objc_storeStrong((id *)&self->_txQos, 0);
  objc_storeStrong((id *)&self->_is5G, 0);

  objc_storeStrong((id *)&self->_queueSetId, 0);
}

@end