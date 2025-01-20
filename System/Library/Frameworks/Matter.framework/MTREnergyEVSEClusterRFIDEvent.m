@interface MTREnergyEVSEClusterRFIDEvent
- (MTREnergyEVSEClusterRFIDEvent)init;
- (NSData)uid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setUid:(id)a3;
@end

@implementation MTREnergyEVSEClusterRFIDEvent

- (MTREnergyEVSEClusterRFIDEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTREnergyEVSEClusterRFIDEvent;
  v4 = [(MTREnergyEVSEClusterRFIDEvent *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    uid = v4->_uid;
    v4->_uid = (NSData *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterRFIDEvent);
  v7 = objc_msgSend_uid(self, v5, v6);
  objc_msgSend_setUid_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_uid, v6, 0);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"<%@: uid:%@ >", v5, v7);;

  return v9;
}

- (NSData)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end