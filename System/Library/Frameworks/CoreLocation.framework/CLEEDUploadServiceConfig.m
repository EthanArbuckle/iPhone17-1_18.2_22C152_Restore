@interface CLEEDUploadServiceConfig
+ (BOOL)supportsSecureCoding;
- (CLEEDUploadServiceConfig)initWithCoder:(id)a3;
- (CLEEDUploadServiceConfig)initWithNumInflightUploads:(int64_t)a3 maxUploadFileSizeMB:(int64_t)a4 maxUploadQuotaMB:(int64_t)a5;
- (id)description;
- (int64_t)maxUploadFileSizeMB;
- (int64_t)maxUploadQuotaMB;
- (int64_t)numInFlightUploads;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLEEDUploadServiceConfig

- (CLEEDUploadServiceConfig)initWithNumInflightUploads:(int64_t)a3 maxUploadFileSizeMB:(int64_t)a4 maxUploadQuotaMB:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v9 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v22 = "-[CLEEDUploadServiceConfig initWithNumInflightUploads:maxUploadFileSizeMB:maxUploadQuotaMB:]";
    __int16 v23 = 2050;
    int64_t v24 = a5;
    __int16 v25 = 2050;
    int64_t v26 = a4;
    __int16 v27 = 2050;
    int64_t v28 = a3;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMSFW,%{public}s[uploadQuotaMB:%{public}ld,maxFileSizeMB:%{public}ld,numInFlightUploads:%{public}ld]", buf, 0x2Au);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v13 = 136446978;
    v14 = "-[CLEEDUploadServiceConfig initWithNumInflightUploads:maxUploadFileSizeMB:maxUploadQuotaMB:]";
    __int16 v15 = 2050;
    int64_t v16 = a5;
    __int16 v17 = 2050;
    int64_t v18 = a4;
    __int16 v19 = 2050;
    int64_t v20 = a3;
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadServiceConfig initWithNumInflightUploads:maxUploadFileSizeMB:maxUploadQuotaMB:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CLEEDUploadServiceConfig;
  result = [(CLEEDUploadServiceConfig *)&v12 init];
  if (result)
  {
    result->_maxUploadFileSizeMB = a4;
    result->_maxUploadQuotaMB = a5;
    result->_numInFlightUploads = a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLEEDUploadServiceConfig;
  [(CLEEDUploadServiceConfig *)&v2 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[uploadQuotaMB:%ld,maxFileSizeMB:%ld,numInFlightUploads:%ld]", -[CLEEDUploadServiceConfig maxUploadQuotaMB](self, "maxUploadQuotaMB"), -[CLEEDUploadServiceConfig maxUploadFileSizeMB](self, "maxUploadFileSizeMB"), -[CLEEDUploadServiceConfig numInFlightUploads](self, "numInFlightUploads"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_maxUploadQuotaMB forKey:@"maxUploadQuotaMB"];
  [a3 encodeInteger:self->_maxUploadFileSizeMB forKey:@"maxUploadFileSizeMB"];
  int64_t numInFlightUploads = self->_numInFlightUploads;

  [a3 encodeInteger:numInFlightUploads forKey:@"numInFlightUploads"];
}

- (CLEEDUploadServiceConfig)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLEEDUploadServiceConfig;
  v4 = [(CLEEDUploadServiceConfig *)&v6 init];
  if (v4)
  {
    v4->_maxUploadQuotaMB = [a3 decodeIntegerForKey:@"maxUploadQuotaMB"];
    v4->_maxUploadFileSizeMB = [a3 decodeIntegerForKey:@"maxUploadFileSizeMB"];
    v4->_int64_t numInFlightUploads = [a3 decodeIntegerForKey:@"numInFlightUploads"];
  }
  return v4;
}

- (int64_t)numInFlightUploads
{
  return self->_numInFlightUploads;
}

- (int64_t)maxUploadFileSizeMB
{
  return self->_maxUploadFileSizeMB;
}

- (int64_t)maxUploadQuotaMB
{
  return self->_maxUploadQuotaMB;
}

@end