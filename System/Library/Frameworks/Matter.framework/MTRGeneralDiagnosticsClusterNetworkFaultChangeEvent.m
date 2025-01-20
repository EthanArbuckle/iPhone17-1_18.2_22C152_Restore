@interface MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent
- (MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent)init;
- (NSArray)current;
- (NSArray)previous;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCurrent:(NSArray *)current;
- (void)setPrevious:(NSArray *)previous;
@end

@implementation MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent

- (MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent;
  v4 = [(MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    current = v4->_current;
    v4->_current = (NSArray *)v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    previous = v4->_previous;
    v4->_previous = (NSArray *)v9;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterNetworkFaultChangeEvent);
  v7 = objc_msgSend_current(self, v5, v6);
  objc_msgSend_setCurrent_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_previous(self, v9, v10);
  objc_msgSend_setPrevious_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: current:%@; previous:%@; >",
    v5,
    self->_current,
  v7 = self->_previous);

  return v7;
}

- (NSArray)current
{
  return self->_current;
}

- (void)setCurrent:(NSArray *)current
{
}

- (NSArray)previous
{
  return self->_previous;
}

- (void)setPrevious:(NSArray *)previous
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previous, 0);

  objc_storeStrong((id *)&self->_current, 0);
}

@end