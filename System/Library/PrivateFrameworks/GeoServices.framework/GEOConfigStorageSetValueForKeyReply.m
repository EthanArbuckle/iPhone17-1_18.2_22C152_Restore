@interface GEOConfigStorageSetValueForKeyReply
- (BOOL)isValid;
- (GEOConfigStorageSetValueForKeyReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOConfigStorageSetValueForKeyReply

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GEOConfigStorageSetValueForKeyReply;
  [(GEOXPCReply *)&v3 encodeToXPCDictionary:a3];
}

- (GEOConfigStorageSetValueForKeyReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOConfigStorageSetValueForKeyReply;
  v4 = [(GEOXPCReply *)&v8 initWithXPCDictionary:a3 error:a4];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

@end