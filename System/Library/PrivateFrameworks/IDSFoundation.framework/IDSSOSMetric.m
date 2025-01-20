@interface IDSSOSMetric
+ (id)metricWithDomain:(unint64_t)a3 type:(unint64_t)a4 error:(int64_t)a5 bagURL:(id)a6;
- (IDSSOSMetric)initWithDomain:(unint64_t)a3 type:(unint64_t)a4 error:(int64_t)a5 bagURL:(id)a6;
- (NSString)name;
- (NSString)operationID;
- (int64_t)sosError;
- (unint64_t)sosDomain;
- (unint64_t)sosType;
- (void)setOperationID:(id)a3;
- (void)setSosDomain:(unint64_t)a3;
- (void)setSosError:(int64_t)a3;
- (void)setSosType:(unint64_t)a3;
@end

@implementation IDSSOSMetric

+ (id)metricWithDomain:(unint64_t)a3 type:(unint64_t)a4 error:(int64_t)a5 bagURL:(id)a6
{
  id v10 = a6;
  id v11 = objc_alloc((Class)a1);
  v14 = objc_msgSend_initWithDomain_type_error_bagURL_(v11, v12, a3, v13, a4, a5, v10);

  return v14;
}

- (IDSSOSMetric)initWithDomain:(unint64_t)a3 type:(unint64_t)a4 error:(int64_t)a5 bagURL:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IDSSOSMetric;
  v12 = [(IDSSOSMetric *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    v12->_sosDomain = a3;
    v12->_sosType = a4;
    v12->_sosError = a5;
    objc_storeStrong((id *)&v12->_operationID, a6);
  }

  return v13;
}

- (NSString)name
{
  return (NSString *)@"BagLoadingFailedMetricName";
}

- (unint64_t)sosDomain
{
  return self->_sosDomain;
}

- (void)setSosDomain:(unint64_t)a3
{
  self->_sosDomain = a3;
}

- (unint64_t)sosType
{
  return self->_sosType;
}

- (void)setSosType:(unint64_t)a3
{
  self->_sosType = a3;
}

- (int64_t)sosError
{
  return self->_sosError;
}

- (void)setSosError:(int64_t)a3
{
  self->_sosError = a3;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end