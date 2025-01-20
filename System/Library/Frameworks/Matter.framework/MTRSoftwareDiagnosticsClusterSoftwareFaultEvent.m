@interface MTRSoftwareDiagnosticsClusterSoftwareFaultEvent
- (MTRSoftwareDiagnosticsClusterSoftwareFaultEvent)init;
- (NSData)faultRecording;
- (NSNumber)id;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFaultRecording:(NSData *)faultRecording;
- (void)setId:(NSNumber *)id;
- (void)setName:(NSString *)name;
@end

@implementation MTRSoftwareDiagnosticsClusterSoftwareFaultEvent

- (MTRSoftwareDiagnosticsClusterSoftwareFaultEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRSoftwareDiagnosticsClusterSoftwareFaultEvent;
  v2 = [(MTRSoftwareDiagnosticsClusterSoftwareFaultEvent *)&v8 init];
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = 0;

    faultRecording = v3->_faultRecording;
    v3->_faultRecording = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSoftwareDiagnosticsClusterSoftwareFaultEvent);
  v7 = objc_msgSend_id(self, v5, v6);
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_faultRecording(self, v13, v14);
  objc_msgSend_setFaultRecording_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id = self->_id;
  name = self->_name;
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_faultRecording, v8, 0);
  v11 = objc_msgSend_stringWithFormat_(v3, v10, @"<%@: id:%@ name:%@; faultRecording:%@; >", v5, id, name, v9);;

  return v11;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(NSNumber *)id
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSData)faultRecording
{
  return self->_faultRecording;
}

- (void)setFaultRecording:(NSData *)faultRecording
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultRecording, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end