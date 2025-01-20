@interface XREngineeringTypeBitpackedEncodingConvention
- (NSArray)entries;
- (XREngineeringTypeBitpackedEncodingConvention)init;
- (void)addEntry:(id)a3;
@end

@implementation XREngineeringTypeBitpackedEncodingConvention

- (XREngineeringTypeBitpackedEncodingConvention)init
{
  v6.receiver = self;
  v6.super_class = (Class)XREngineeringTypeBitpackedEncodingConvention;
  v2 = [(XREngineeringTypeEncodingConvention *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSArray)entries
{
  return (NSArray *)self->_entries;
}

- (void)addEntry:(id)a3
{
  [self->_entries addObject:a2 withKey:(uint64_t)a3 withValue:v3 withValue:v4];
}

- (void).cxx_destruct
{
}

@end