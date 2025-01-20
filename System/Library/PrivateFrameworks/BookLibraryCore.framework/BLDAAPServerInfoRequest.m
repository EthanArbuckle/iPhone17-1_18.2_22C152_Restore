@interface BLDAAPServerInfoRequest
- (BLDAAPServerInfoRequest)initWithDSID:(id)a3 reason:(int64_t)a4;
@end

@implementation BLDAAPServerInfoRequest

- (BLDAAPServerInfoRequest)initWithDSID:(id)a3 reason:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BLDAAPServerInfoRequest;
  v4 = [(BLDAAPURLRequest *)&v11 initWithDSID:a3 reason:a4];
  v7 = v4;
  if (v4)
  {
    objc_msgSend_setDaapURL_(v4, v5, @"server-info", v6);
    objc_msgSend_setRequestMethod_(v7, v8, 2, v9);
  }
  return v7;
}

@end