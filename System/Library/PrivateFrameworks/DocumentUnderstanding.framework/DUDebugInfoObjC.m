@interface DUDebugInfoObjC
- (DUDebugInfoObjC)init;
- (NSString)debugString;
- (void)setDebugString:(id)a3;
@end

@implementation DUDebugInfoObjC

- (void).cxx_destruct
{
}

- (void)setDebugString:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setDebugString_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)debugString
{
  return (NSString *)objc_msgSend_debugString(self->_underlying, a2, v2, v3, v4);
}

- (DUDebugInfoObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUDebugInfoObjC;
  uint64_t v2 = [(DUDebugInfoObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding11DUDebugInfo);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

@end