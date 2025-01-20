@interface IDSPNRMetric
- (IDSPNRMetric)initWithPNRReason:(int64_t)a3 mechanism:(int64_t)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (int64_t)mechanism;
- (int64_t)pnrReason;
- (void)setMechanism:(int64_t)a3;
- (void)setPnrReason:(int64_t)a3;
@end

@implementation IDSPNRMetric

- (IDSPNRMetric)initWithPNRReason:(int64_t)a3 mechanism:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IDSPNRMetric;
  result = [(IDSPNRMetric *)&v7 init];
  if (result)
  {
    result->_pnrReason = a3;
    result->_mechanism = a4;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"pnr";
}

- (NSDictionary)dictionaryRepresentation
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = @"reason";
  v5 = NSNumber;
  uint64_t v6 = objc_msgSend_pnrReason(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithInteger_(v5, v7, v6, v8);
  v22[1] = @"mechanism";
  v23[0] = v9;
  v10 = NSNumber;
  uint64_t v14 = objc_msgSend_mechanism(self, v11, v12, v13);
  v17 = objc_msgSend_numberWithInteger_(v10, v15, v14, v16);
  v23[1] = v17;
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v23, v19, v22, 2);

  return (NSDictionary *)v20;
}

- (int64_t)pnrReason
{
  return self->_pnrReason;
}

- (void)setPnrReason:(int64_t)a3
{
  self->_pnrReason = a3;
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(int64_t)a3
{
  self->_mechanism = a3;
}

@end