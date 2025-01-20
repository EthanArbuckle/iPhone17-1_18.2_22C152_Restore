@interface CTDataUsageBuilder
+ (id)getVirtualBundleIDForProcName:(id)a3;
- (BOOL)addUsage:(id)a3 forBundle:(id)a4 forPeriod:(unint64_t)a5 withPreferredLanguages:(id)a6 withBlockedBundleIds:(id)a7;
- (CTDataUsageBuilder)initWithPeriods:(unint64_t)a3 andRegistry:(const void *)a4 andLogger:(const void *)a5 andGreenTeaCapable:(BOOL)a6;
- (CTDeviceDataUsage)deviceUsage;
- (NSMutableDictionary)appProperties;
- (id).cxx_construct;
- (void)setAppProperties:(id)a3;
- (void)setDeviceUsage:(id)a3;
@end

@implementation CTDataUsageBuilder

+ (id)getVirtualBundleIDForProcName:(id)a3
{
  id v3 = a3;
  v4 = [&off_100076578 objectForKey:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else if (![v3 hasPrefix:@"com.apple."] {
         || ([v3 substringFromIndex:objc_msgSend(@"com.apple.", "length")],
  }
             v7 = objc_claimAutoreleasedReturnValue(),
             [&off_100076578 objectForKey:v7],
             id v6 = (id)objc_claimAutoreleasedReturnValue(),
             v7,
             !v6))
  {
    v8 = [@"com.apple." stringByAppendingString:v3];
    id v6 = [&off_100076578 objectForKey:v8];
  }

  return v6;
}

- (CTDataUsageBuilder)initWithPeriods:(unint64_t)a3 andRegistry:(const void *)a4 andLogger:(const void *)a5 andGreenTeaCapable:(BOOL)a6
{
  v20.receiver = self;
  v20.super_class = (Class)CTDataUsageBuilder;
  v10 = [(CTDataUsageBuilder *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v13 = *(Registry **)a4;
    uint64_t v12 = *((void *)a4 + 1);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v10->fRegistry.__cntrl_;
    v11->fRegistry.__ptr_ = v13;
    v11->fRegistry.__cntrl_ = (__shared_weak_count *)v12;
    if (cntrl) {
      sub_10000921C(cntrl);
    }
    v11->fLogger = a5;
    v11->fIsGreenTea = a6;
    v15 = (CTDeviceDataUsage *)[objc_alloc((Class)CTDeviceDataUsage) initWithPeriods:a3];
    deviceUsage = v11->_deviceUsage;
    v11->_deviceUsage = v15;

    uint64_t v17 = +[NSMutableDictionary dictionaryWithCapacity:200];
    appProperties = v11->_appProperties;
    v11->_appProperties = (NSMutableDictionary *)v17;
  }
  return v11;
}

- (BOOL)addUsage:(id)a3 forBundle:(id)a4 forPeriod:(unint64_t)a5 withPreferredLanguages:(id)a6 withBlockedBundleIds:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [(CTDataUsageBuilder *)self deviceUsage];
  LOBYTE(self) = [v16 addUsage:v12 forBundle:v13 forPeriod:a5 withPreferredLanguages:v14 withBlockedBundleIds:v15 using:self];

  return (char)self;
}

- (CTDeviceDataUsage)deviceUsage
{
  return self->_deviceUsage;
}

- (void)setDeviceUsage:(id)a3
{
}

- (NSMutableDictionary)appProperties
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAppProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProperties, 0);
  objc_storeStrong((id *)&self->_deviceUsage, 0);
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl)
  {
    sub_10000921C((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end