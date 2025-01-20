@interface GEOPlaceCachePlaceReply
- (BOOL)isValid;
- (GEOPlaceCachePlaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)identifiers;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation GEOPlaceCachePlaceReply

- (GEOPlaceCachePlaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceCachePlaceReply;
  v7 = [(GEOXPCReply *)&v19 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "identifiers", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      v10 = (void *)MEMORY[0x1E4F28DC0];
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      uint64_t v14 = [v10 unarchivedObjectOfClasses:v13 fromData:v9 error:a4];
      identifiers = v7->_identifiers;
      v7->_identifiers = (NSArray *)v14;
    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceCachePlaceReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_identifiers count])
  {
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_identifiers requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "identifiers", (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end