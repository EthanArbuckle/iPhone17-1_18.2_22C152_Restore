@interface GEOOfflineDataCheckExistenceReply
- (BOOL)exists;
- (BOOL)isValid;
- (GEOOfflineDataCheckExistenceReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setExists:(BOOL)a3;
@end

@implementation GEOOfflineDataCheckExistenceReply

- (GEOOfflineDataCheckExistenceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineDataCheckExistenceReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_exists = xpc_dictionary_get_BOOL(v6, "exists");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineDataCheckExistenceReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "exists", self->_exists);
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)exists
{
  return self->_exists;
}

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

@end