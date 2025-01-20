@interface GEOLocationShiftingVersionResponse
- (BOOL)isValid;
- (GEOLocationShiftingVersionResponse)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unsigned)version;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation GEOLocationShiftingVersionResponse

- (GEOLocationShiftingVersionResponse)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLocationShiftingVersionResponse;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_version = xpc_dictionary_get_int64(v6, "version");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOLocationShiftingVersionResponse;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "version", self->_version);
}

- (BOOL)isValid
{
  return 1;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

@end