@interface IDSReportClientEvent
+ (BOOL)supportsSecureCoding;
- (IDSReportClientEvent)initWithCoder:(id)a3;
- (IDSReportClientEvent)initWithReport:(id)a3 reportType:(id)a4 timeout:(id)a5;
- (NSDictionary)report;
- (NSNumber)timeout;
- (NSString)reportType;
- (void)encodeWithCoder:(id)a3;
- (void)setReport:(id)a3;
- (void)setReportType:(id)a3;
- (void)setTimeout:(id)a3;
@end

@implementation IDSReportClientEvent

- (IDSReportClientEvent)initWithReport:(id)a3 reportType:(id)a4 timeout:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSReportClientEvent;
  v11 = [(IDSReportClientEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(IDSReportClientEvent *)v11 setReport:v8];
    [(IDSReportClientEvent *)v12 setReportType:v9];
    [(IDSReportClientEvent *)v12 setTimeout:v10];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  report = self->_report;
  id v5 = a3;
  [v5 encodeObject:report forKey:@"report"];
  [v5 encodeObject:self->_reportType forKey:@"report-type"];
  [v5 encodeObject:self->_timeout forKey:@"timeout"];
}

- (IDSReportClientEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"report-type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeout"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"report"];

  v12 = [(IDSReportClientEvent *)self initWithReport:v11 reportType:v5 timeout:v6];
  return v12;
}

- (NSString)reportType
{
  return self->_reportType;
}

- (void)setReportType:(id)a3
{
}

- (NSDictionary)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_report, 0);

  objc_storeStrong((id *)&self->_reportType, 0);
}

@end