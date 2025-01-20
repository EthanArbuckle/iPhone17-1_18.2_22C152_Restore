@interface GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply
- (BOOL)isValid;
- (GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply

- (GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply;
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
  v3.super_class = (Class)GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryReply;
  [(GEOXPCReply *)&v3 encodeToXPCDictionary:a3];
}

- (BOOL)isValid
{
  return 1;
}

@end