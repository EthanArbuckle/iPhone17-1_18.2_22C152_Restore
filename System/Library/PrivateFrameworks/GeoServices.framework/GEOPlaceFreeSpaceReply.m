@interface GEOPlaceFreeSpaceReply
- (BOOL)isValid;
- (GEOPlaceFreeSpaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)freedBytes;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setFreedBytes:(unint64_t)a3;
@end

@implementation GEOPlaceFreeSpaceReply

- (GEOPlaceFreeSpaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceFreeSpaceReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_freedBytes = xpc_dictionary_get_int64(v6, "sz");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOPlaceFreeSpaceReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "sz", self->_freedBytes);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)freedBytes
{
  return self->_freedBytes;
}

- (void)setFreedBytes:(unint64_t)a3
{
  self->_freedBytes = a3;
}

@end