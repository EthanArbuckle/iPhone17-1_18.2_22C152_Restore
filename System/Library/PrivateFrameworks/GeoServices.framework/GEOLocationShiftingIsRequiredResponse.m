@interface GEOLocationShiftingIsRequiredResponse
- (BOOL)isValid;
- (BOOL)required;
- (GEOLocationShiftingIsRequiredResponse)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setRequired:(BOOL)a3;
@end

@implementation GEOLocationShiftingIsRequiredResponse

- (GEOLocationShiftingIsRequiredResponse)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLocationShiftingIsRequiredResponse;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_required = xpc_dictionary_get_BOOL(v6, "required");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOLocationShiftingIsRequiredResponse;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "required", self->_required);
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)required
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

@end