@interface AppleIDAuthorizationRequestInfo
- (AppleIDAuthorizationRequestInfo)initWithClientID:(id)a3 teamID:(id)a4 serviceID:(id)a5;
- (NSString)clientID;
- (NSString)serviceID;
- (NSString)teamID;
@end

@implementation AppleIDAuthorizationRequestInfo

- (AppleIDAuthorizationRequestInfo)initWithClientID:(id)a3 teamID:(id)a4 serviceID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    if (qword_10039F4F8 != -1) {
      dispatch_once(&qword_10039F4F8, &stru_100357160);
    }
    v15 = qword_10039F4B0;
    if (os_log_type_enabled((os_log_t)qword_10039F4B0, OS_LOG_TYPE_ERROR)) {
      sub_1002C08E0((uint64_t)self, v15);
    }
    goto LABEL_14;
  }
  if (!v10)
  {
    if (qword_10039F4F8 != -1) {
      dispatch_once(&qword_10039F4F8, &stru_100357160);
    }
    v16 = qword_10039F4B0;
    if (os_log_type_enabled((os_log_t)qword_10039F4B0, OS_LOG_TYPE_ERROR)) {
      sub_1002C0958((uint64_t)self, v16);
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v18.receiver = self;
  v18.super_class = (Class)AppleIDAuthorizationRequestInfo;
  v12 = [(AppleIDAuthorizationRequestInfo *)&v18 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  self = p_isa;
  v14 = self;
LABEL_15:

  return v14;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end