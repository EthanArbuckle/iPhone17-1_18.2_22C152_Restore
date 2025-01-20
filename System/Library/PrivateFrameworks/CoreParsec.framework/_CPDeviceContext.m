@interface _CPDeviceContext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)country;
- (NSString)deviceModel;
- (NSString)locale;
- (NSString)osVersion;
- (unint64_t)hash;
- (void)setCountry:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setLocale:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPDeviceContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);

  objc_storeStrong((id *)&self->_country, 0);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_country hash];
  NSUInteger v4 = [(NSString *)self->_deviceModel hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_locale hash];
  return v4 ^ v5 ^ [(NSString *)self->_osVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_CPDeviceContext *)self country];
  v6 = [v4 country];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_CPDeviceContext *)self country];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_CPDeviceContext *)self country];
    v10 = [v4 country];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPDeviceContext *)self deviceModel];
  v6 = [v4 deviceModel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_CPDeviceContext *)self deviceModel];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPDeviceContext *)self deviceModel];
    v15 = [v4 deviceModel];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPDeviceContext *)self locale];
  v6 = [v4 locale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_CPDeviceContext *)self locale];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_CPDeviceContext *)self locale];
    v20 = [v4 locale];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPDeviceContext *)self osVersion];
  v6 = [v4 osVersion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_CPDeviceContext *)self osVersion];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_CPDeviceContext *)self osVersion];
    v25 = [v4 osVersion];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_CPDeviceContext *)self country];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_CPDeviceContext *)self deviceModel];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(_CPDeviceContext *)self locale];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_CPDeviceContext *)self osVersion];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPDeviceContextReadFrom(self, (uint64_t)a3);
}

@end