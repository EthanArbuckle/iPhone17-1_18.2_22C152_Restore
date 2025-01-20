@interface GEOPlaceCalculateFreeableSpaceReply
- (BOOL)isValid;
- (GEOPlaceCalculateFreeableSpaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)freeableBytes;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setFreeableBytes:(unint64_t)a3;
@end

@implementation GEOPlaceCalculateFreeableSpaceReply

- (GEOPlaceCalculateFreeableSpaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceCalculateFreeableSpaceReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_freeableBytes = xpc_dictionary_get_int64(v6, "sz");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOPlaceCalculateFreeableSpaceReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "sz", self->_freeableBytes);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)freeableBytes
{
  return self->_freeableBytes;
}

- (void)setFreeableBytes:(unint64_t)a3
{
  self->_freeableBytes = a3;
}

@end