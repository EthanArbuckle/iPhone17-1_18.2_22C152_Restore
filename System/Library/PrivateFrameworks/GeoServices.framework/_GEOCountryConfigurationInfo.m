@interface _GEOCountryConfigurationInfo
+ (_GEOCountryConfigurationInfo)countryCode:(unsigned int)a3 source:;
+ (_GEOCountryConfigurationInfo)get;
- (BOOL)isEqual:(id)a3;
- (_GEOCountryConfigurationInfo)initWithDictionary:(id)a3;
- (id)description;
@end

@implementation _GEOCountryConfigurationInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if ([(NSString *)self->_countryCode isEqual:*((void *)v5 + 2)]) {
      BOOL v6 = self->_source == v5[2];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (_GEOCountryConfigurationInfo)countryCode:(unsigned int)a3 source:
{
  id v4 = a2;
  self;
  v5 = [_GEOCountryConfigurationInfo alloc];
  id v6 = v4;
  if (v5)
  {
    v13.receiver = v5;
    v13.super_class = (Class)_GEOCountryConfigurationInfo;
    v5 = (_GEOCountryConfigurationInfo *)objc_msgSendSuper2(&v13, sel_init);
    if (!v5)
    {
LABEL_5:
      v5 = v5;
      v11 = v5;
      goto LABEL_7;
    }
    uint64_t v7 = [v6 copy];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v7;

    if ([(NSString *)v5->_countryCode length])
    {
      v5->_source = a3;
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
      dateOfLastUpdate = v5->_dateOfLastUpdate;
      v5->_dateOfLastUpdate = (NSDate *)v9;

      goto LABEL_5;
    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

+ (_GEOCountryConfigurationInfo)get
{
  self;
  v0 = _getValue(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1E9113928, 1, 0, 0, 0);
  objc_opt_class();
  v1 = 0;
  if (objc_opt_isKindOfClass()) {
    v1 = [[_GEOCountryConfigurationInfo alloc] initWithDictionary:v0];
  }

  return v1;
}

- (_GEOCountryConfigurationInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 objectForKeyedSubscript:@"cc"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v5 length])
    {
      v8 = 0;
LABEL_17:

      goto LABEL_18;
    }
    id v6 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v7 = [v6 unsignedIntValue];
    }
    else {
      unsigned int v7 = 1;
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"date"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];

      uint64_t v9 = (void *)v10;
    }
    v14.receiver = self;
    v14.super_class = (Class)_GEOCountryConfigurationInfo;
    self = [(_GEOCountryConfigurationInfo *)&v14 init];
    if (self)
    {
      v11 = (NSString *)[v5 copy];
      countryCode = self->_countryCode;
      self->_countryCode = v11;

      if (![(NSString *)self->_countryCode length])
      {
        v8 = 0;
        goto LABEL_16;
      }
      self->_source = v7;
      objc_storeStrong((id *)&self->_dateOfLastUpdate, v9);
    }
    v8 = self;
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<\"%@\" source {raw 0x%0X device %x source %x} updated %@>", self->_countryCode, self->_source, self->_source & 0xFF00, self->_source, self->_dateOfLastUpdate];
}

@end