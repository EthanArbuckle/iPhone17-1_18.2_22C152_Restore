@interface HMReportContext
+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5;
- (HMReportContext)initWithReportDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5;
- (NSData)requestInfo;
- (NSString)reportDomain;
- (double)reportTimeout;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setReportTimeout:(double)a3;
@end

@implementation HMReportContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);

  objc_storeStrong((id *)&self->_reportDomain, 0);
}

- (void)setReportTimeout:(double)a3
{
  self->_reportTimeout = a3;
}

- (double)reportTimeout
{
  return self->_reportTimeout;
}

- (NSData)requestInfo
{
  return self->_requestInfo;
}

- (NSString)reportDomain
{
  return self->_reportDomain;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[HMMutableReportContext allocWithZone:a3];
  v5 = [(HMReportContext *)self reportDomain];
  v6 = [(HMReportContext *)self requestInfo];
  [(HMReportContext *)self reportTimeout];
  v7 = -[HMReportContext initWithReportDomain:requestInfo:timeout:](v4, "initWithReportDomain:requestInfo:timeout:", v5, v6);

  return v7;
}

+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[HMReportContext alloc] initWithReportDomain:v8 requestInfo:v7 timeout:a5];

  return v9;
}

- (HMReportContext)initWithReportDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMBatchRequest *)_HMFPreconditionFailure();
    [(HMBatchRequest *)v17 setRequests:v19];
    return result;
  }
  v20.receiver = self;
  v20.super_class = (Class)HMReportContext;
  v11 = [(HMReportContext *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    reportDomain = v11->_reportDomain;
    v11->_reportDomain = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    requestInfo = v11->_requestInfo;
    v11->_requestInfo = (NSData *)v14;

    v11->_reportTimeout = a5;
  }

  return v11;
}

@end