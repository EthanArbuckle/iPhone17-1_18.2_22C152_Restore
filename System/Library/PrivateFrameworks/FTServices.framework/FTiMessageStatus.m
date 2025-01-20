@interface FTiMessageStatus
+ (id)sharedInstance;
- (BOOL)iMessageSupported;
- (FTServiceStatus)serviceStatus;
- (id)initPrivate;
@end

@implementation FTiMessageStatus

+ (id)sharedInstance
{
  if (qword_1EB47C838 != -1) {
    dispatch_once(&qword_1EB47C838, &unk_1EFE078C0);
  }
  v2 = (void *)qword_1EB47C848;

  return v2;
}

- (id)initPrivate
{
  v8.receiver = self;
  v8.super_class = (Class)FTiMessageStatus;
  v4 = [(FTiMessageStatus *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(FTServiceStatus, v2, v3);
    serviceStatus = v4->_serviceStatus;
    v4->_serviceStatus = (FTServiceStatus *)v5;
  }
  return v4;
}

- (BOOL)iMessageSupported
{
  uint64_t v3 = objc_msgSend_serviceStatus(self, a2, v2);
  char v6 = objc_msgSend_iMessageSupported(v3, v4, v5);

  return v6;
}

- (FTServiceStatus)serviceStatus
{
  return self->_serviceStatus;
}

- (void).cxx_destruct
{
}

@end