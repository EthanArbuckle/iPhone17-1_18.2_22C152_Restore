@interface CDPEscrowRecordReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CDPEscrowRecordReport)initWithCoder:(id)a3;
- (CDPEscrowRecordReport)initWithDefaultValues;
- (CDPEscrowRecordReport)initWithDeviceStatus:(id)a3;
- (CDPEscrowRecordViability)deviceViability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updatedReportWithRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceViability:(id)a3;
@end

@implementation CDPEscrowRecordReport

- (CDPEscrowRecordReport)initWithDefaultValues
{
  v3 = [[CDPEscrowRecordViability alloc] initWithDefaultValues];
  v4 = [(CDPEscrowRecordReport *)self initWithDeviceStatus:v3];

  return v4;
}

- (CDPEscrowRecordReport)initWithDeviceStatus:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPEscrowRecordReport;
  v6 = [(CDPEscrowRecordReport *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceViability, a3);
    v8 = v7;
  }

  return v7;
}

- (id)updatedReportWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [CDPEscrowRecordReport alloc];
  v6 = [(CDPEscrowRecordReport *)self deviceViability];
  v7 = -[CDPEscrowRecordViability updatedViabiltyWithRecord:](v6, v4);

  v8 = [(CDPEscrowRecordReport *)v5 initWithDeviceStatus:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDPEscrowRecordReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPEscrowRecordReport;
  id v5 = [(CDPEscrowRecordReport *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceViability"];
    uint64_t v7 = self;

    deviceViability = v5->_deviceViability;
    v5->_deviceViability = (CDPEscrowRecordViability *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CDPEscrowRecordReport *)self deviceViability];
    v6 = [v4 deviceViability];
    if ([v5 isEqual:v6])
    {

      char v7 = 1;
    }
    else
    {
      v8 = [(CDPEscrowRecordReport *)self deviceViability];
      v9 = [v4 deviceViability];
      BOOL v10 = v8 != v9;

      char v7 = !v10;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [CDPEscrowRecordReport alloc];
  v6 = [(CDPEscrowRecordReport *)self deviceViability];
  char v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(CDPEscrowRecordReport *)v5 initWithDeviceStatus:v7];

  return v8;
}

- (CDPEscrowRecordViability)deviceViability
{
  return self->_deviceViability;
}

- (void)setDeviceViability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end