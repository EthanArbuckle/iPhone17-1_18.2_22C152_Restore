@interface GEOLocationShiftingEnabledResponse
- (BOOL)enabled;
- (BOOL)isValid;
- (GEOLocationShiftingEnabledResponse)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation GEOLocationShiftingEnabledResponse

- (BOOL)isValid
{
  return 1;
}

- (GEOLocationShiftingEnabledResponse)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLocationShiftingEnabledResponse;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_enabled = xpc_dictionary_get_BOOL(v6, "enabled");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOLocationShiftingEnabledResponse;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "enabled", self->_enabled);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end