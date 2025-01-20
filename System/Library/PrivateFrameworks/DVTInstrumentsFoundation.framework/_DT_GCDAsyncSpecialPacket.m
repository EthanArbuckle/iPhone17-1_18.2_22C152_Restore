@interface _DT_GCDAsyncSpecialPacket
- (_DT_GCDAsyncSpecialPacket)initWithTLSSettings:(id)a3;
@end

@implementation _DT_GCDAsyncSpecialPacket

- (_DT_GCDAsyncSpecialPacket)initWithTLSSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DT_GCDAsyncSpecialPacket;
  v5 = [(_DT_GCDAsyncSpecialPacket *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tlsSettings = v5->tlsSettings;
    v5->tlsSettings = (NSDictionary *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end