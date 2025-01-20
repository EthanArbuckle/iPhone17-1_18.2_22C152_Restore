@interface GEOOfflineServiceSetStateReply
- (BOOL)isValid;
- (GEOOfflineServiceSetStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOOfflineServiceSetStateReply

- (GEOOfflineServiceSetStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOOfflineServiceSetStateReply;
  v4 = [(GEOXPCReply *)&v8 initWithXPCDictionary:a3 error:a4];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GEOOfflineServiceSetStateReply;
  [(GEOXPCReply *)&v3 encodeToXPCDictionary:a3];
}

- (BOOL)isValid
{
  return 1;
}

@end