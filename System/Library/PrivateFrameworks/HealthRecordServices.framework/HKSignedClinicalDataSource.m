@interface HKSignedClinicalDataSource
+ (BOOL)supportsSecureCoding;
+ (id)sourceWithQRCodeValue:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataFile)file;
- (HKSignedClinicalDataQRRepresentation)QRRepresentation;
- (HKSignedClinicalDataSource)init;
- (HKSignedClinicalDataSource)initWithCoder:(id)a3;
- (HKSignedClinicalDataSource)initWithFile:(id)a3 type:(int64_t)a4;
- (HKSignedClinicalDataSource)initWithQRRepresentation:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataSource

- (HKSignedClinicalDataSource)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataSource)initWithFile:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSignedClinicalDataSource;
  v7 = [(HKSignedClinicalDataSource *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    file = v7->_file;
    v7->_file = (HKSignedClinicalDataFile *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (HKSignedClinicalDataSource)initWithQRRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSignedClinicalDataSource;
  v5 = [(HKSignedClinicalDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    QRRepresentation = v5->_QRRepresentation;
    v5->_QRRepresentation = (HKSignedClinicalDataQRRepresentation *)v6;

    v5->_type = [v4 sourceType];
  }

  return v5;
}

+ (id)sourceWithQRCodeValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [NSURL URLWithString:v5];
  if (objc_msgSend(v6, "hk_isRewrittenHealthCardQRCodeURL"))
  {
    v7 = [v6 fragment];

    if (v7)
    {
      uint64_t v8 = NSString;
      objc_super v9 = [v6 fragment];
      [v8 stringWithFormat:@"%@%@", @"shc:/", v9];
    }
    else
    {
      v10 = [v6 path];
      objc_super v9 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x263F09FA8], "length") + 2);

      [NSString stringWithFormat:@"%@%@", @"shc:/", v9];
    uint64_t v11 = };

    id v5 = (id)v11;
  }
  if (!objc_msgSend(v6, "hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL")) {
    goto LABEL_9;
  }
  v12 = [v6 fragment];

  if (!v12)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"invalid EU-DCC payload");
LABEL_14:

    goto LABEL_15;
  }
  v13 = NSString;
  v14 = [v6 fragment];
  v15 = [v13 stringWithFormat:@"%@%@", @"HC1:", v14];

  id v5 = [v15 stringByRemovingPercentEncoding];

  if (v5)
  {
LABEL_9:
    v16 = +[HKSignedClinicalDataQRSegment segmentFromQRCodeValue:v5 error:a4];
    if (v16)
    {
      v17 = +[HKSignedClinicalDataQRRepresentation representationWithQRSegment:v16];
      v12 = [[HKSignedClinicalDataSource alloc] initWithQRRepresentation:v17];
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"could not reverse encoding of EU-DCC payload");
  v12 = 0;
LABEL_15:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HKSignedClinicalDataSource *)a3;
  uint64_t v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    file = self->_file;
    objc_super v9 = [(HKSignedClinicalDataSource *)v7 file];
    if (file != v9)
    {
      uint64_t v10 = [(HKSignedClinicalDataSource *)v7 file];
      if (!v10)
      {
        BOOL v13 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_file;
      v12 = [(HKSignedClinicalDataSource *)v7 file];
      if (![(HKSignedClinicalDataFile *)v11 isEqual:v12])
      {
        BOOL v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v24 = v12;
    }
    QRRepresentation = self->_QRRepresentation;
    uint64_t v15 = [(HKSignedClinicalDataSource *)v7 QRRepresentation];
    if (QRRepresentation == (HKSignedClinicalDataQRRepresentation *)v15)
    {
      int64_t type = self->_type;
      BOOL v13 = type == [(HKSignedClinicalDataSource *)v7 type];
    }
    else
    {
      v16 = (void *)v15;
      uint64_t v17 = [(HKSignedClinicalDataSource *)v7 QRRepresentation];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = self->_QRRepresentation;
        v20 = [(HKSignedClinicalDataSource *)v7 QRRepresentation];
        if ([(HKSignedClinicalDataQRRepresentation *)v19 isEqual:v20])
        {
          int64_t v21 = self->_type;
          BOOL v13 = v21 == [(HKSignedClinicalDataSource *)v7 type];

          goto LABEL_18;
        }
      }
      BOOL v13 = 0;
    }
LABEL_18:
    v12 = v24;
    if (file != v9) {
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v13 = 1;
LABEL_22:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  file = self->_file;
  id v5 = a3;
  [v5 encodeObject:file forKey:@"file"];
  [v5 encodeObject:self->_QRRepresentation forKey:@"QRRepresentation"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (HKSignedClinicalDataSource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
  if (v5)
  {
    if ([v4 containsValueForKey:@"type"])
    {
      self = -[HKSignedClinicalDataSource initWithFile:type:](self, "initWithFile:type:", v5, [v4 decodeIntegerForKey:@"type"]);
      uint64_t v6 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      uint64_t v6 = 0;
    }
  }
  else
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QRRepresentation"];
    if (v7)
    {
      self = [(HKSignedClinicalDataSource *)self initWithQRRepresentation:v7];
      uint64_t v6 = self;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        -[HKSignedClinicalDataSource initWithCoder:](v8);
      }
      objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (HKSignedClinicalDataFile)file
{
  return self->_file;
}

- (HKSignedClinicalDataQRRepresentation)QRRepresentation
{
  return self->_QRRepresentation;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QRRepresentation, 0);

  objc_storeStrong((id *)&self->_file, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221D38000, log, OS_LOG_TYPE_ERROR, "HKSignedClinicalDataSource.initWithCoder: decoded neither a file nor a QR representation, returning nil", v1, 2u);
}

@end