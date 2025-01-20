@interface MTRSoftwareDiagnosticsClusterThreadMetricsStruct
- (MTRSoftwareDiagnosticsClusterThreadMetricsStruct)init;
- (NSNumber)id;
- (NSNumber)stackFreeCurrent;
- (NSNumber)stackFreeMinimum;
- (NSNumber)stackSize;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setId:(NSNumber *)id;
- (void)setName:(NSString *)name;
- (void)setStackFreeCurrent:(NSNumber *)stackFreeCurrent;
- (void)setStackFreeMinimum:(NSNumber *)stackFreeMinimum;
- (void)setStackSize:(NSNumber *)stackSize;
@end

@implementation MTRSoftwareDiagnosticsClusterThreadMetricsStruct

- (MTRSoftwareDiagnosticsClusterThreadMetricsStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRSoftwareDiagnosticsClusterThreadMetricsStruct;
  v2 = [(MTRSoftwareDiagnosticsClusterThreadMetricsStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = 0;

    stackFreeCurrent = v3->_stackFreeCurrent;
    v3->_stackFreeCurrent = 0;

    stackFreeMinimum = v3->_stackFreeMinimum;
    v3->_stackFreeMinimum = 0;

    stackSize = v3->_stackSize;
    v3->_stackSize = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSoftwareDiagnosticsClusterThreadMetricsStruct);
  v7 = objc_msgSend_id(self, v5, v6);
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_stackFreeCurrent(self, v13, v14);
  objc_msgSend_setStackFreeCurrent_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_stackFreeMinimum(self, v17, v18);
  objc_msgSend_setStackFreeMinimum_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_stackSize(self, v21, v22);
  objc_msgSend_setStackSize_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: id:%@; name:%@; stackFreeCurrent:%@; stackFreeMinimum:%@; stackSize:%@; >",
    v5,
    self->_id,
    self->_name,
    self->_stackFreeCurrent,
    self->_stackFreeMinimum,
  v7 = self->_stackSize);

  return v7;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(NSNumber *)id
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSNumber)stackFreeCurrent
{
  return self->_stackFreeCurrent;
}

- (void)setStackFreeCurrent:(NSNumber *)stackFreeCurrent
{
}

- (NSNumber)stackFreeMinimum
{
  return self->_stackFreeMinimum;
}

- (void)setStackFreeMinimum:(NSNumber *)stackFreeMinimum
{
}

- (NSNumber)stackSize
{
  return self->_stackSize;
}

- (void)setStackSize:(NSNumber *)stackSize
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackSize, 0);
  objc_storeStrong((id *)&self->_stackFreeMinimum, 0);
  objc_storeStrong((id *)&self->_stackFreeCurrent, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end