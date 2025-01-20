@interface MTRGeneralDiagnosticsClusterBootReasonEvent
- (MTRGeneralDiagnosticsClusterBootReasonEvent)init;
- (NSNumber)bootReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBootReason:(NSNumber *)bootReason;
@end

@implementation MTRGeneralDiagnosticsClusterBootReasonEvent

- (MTRGeneralDiagnosticsClusterBootReasonEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRGeneralDiagnosticsClusterBootReasonEvent;
  v2 = [(MTRGeneralDiagnosticsClusterBootReasonEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    bootReason = v2->_bootReason;
    v2->_bootReason = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterBootReasonEvent);
  v7 = objc_msgSend_bootReason(self, v5, v6);
  objc_msgSend_setBootReason_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: bootReason:%@ >", v5, self->_bootReason);;

  return v7;
}

- (NSNumber)bootReason
{
  return self->_bootReason;
}

- (void)setBootReason:(NSNumber *)bootReason
{
}

- (void).cxx_destruct
{
}

@end