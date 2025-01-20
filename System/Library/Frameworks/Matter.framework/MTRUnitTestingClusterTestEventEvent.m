@interface MTRUnitTestingClusterTestEventEvent
- (MTRUnitTestingClusterSimpleStruct)arg4;
- (MTRUnitTestingClusterTestEventEvent)init;
- (NSArray)arg5;
- (NSArray)arg6;
- (NSNumber)arg1;
- (NSNumber)arg2;
- (NSNumber)arg3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(NSNumber *)arg1;
- (void)setArg2:(NSNumber *)arg2;
- (void)setArg3:(NSNumber *)arg3;
- (void)setArg4:(MTRUnitTestingClusterSimpleStruct *)arg4;
- (void)setArg5:(NSArray *)arg5;
- (void)setArg6:(NSArray *)arg6;
@end

@implementation MTRUnitTestingClusterTestEventEvent

- (MTRUnitTestingClusterTestEventEvent)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTRUnitTestingClusterTestEventEvent;
  v2 = [(MTRUnitTestingClusterTestEventEvent *)&v18 init];
  v3 = v2;
  if (v2)
  {
    arg1 = v2->_arg1;
    v2->_arg1 = (NSNumber *)&unk_26F9C8620;

    arg2 = v3->_arg2;
    v3->_arg2 = (NSNumber *)&unk_26F9C8620;

    arg3 = v3->_arg3;
    v3->_arg3 = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_opt_new();
    arg4 = v3->_arg4;
    v3->_arg4 = (MTRUnitTestingClusterSimpleStruct *)v7;

    uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF8C0], v9, v10);
    arg5 = v3->_arg5;
    v3->_arg5 = (NSArray *)v11;

    uint64_t v15 = objc_msgSend_array(MEMORY[0x263EFF8C0], v13, v14);
    arg6 = v3->_arg6;
    v3->_arg6 = (NSArray *)v15;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestEventEvent);
  uint64_t v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_arg2(self, v9, v10);
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_arg3(self, v13, v14);
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_arg4(self, v17, v18);
  objc_msgSend_setArg4_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_arg5(self, v21, v22);
  objc_msgSend_setArg5_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_arg6(self, v25, v26);
  objc_msgSend_setArg6_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@; arg2:%@; arg3:%@; arg4:%@; arg5:%@; arg6:%@; >",
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3,
    self->_arg4,
    self->_arg5,
  uint64_t v7 = self->_arg6);

  return v7;
}

- (NSNumber)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSNumber *)arg1
{
}

- (NSNumber)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSNumber *)arg2
{
}

- (NSNumber)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSNumber *)arg3
{
}

- (MTRUnitTestingClusterSimpleStruct)arg4
{
  return self->_arg4;
}

- (void)setArg4:(MTRUnitTestingClusterSimpleStruct *)arg4
{
}

- (NSArray)arg5
{
  return self->_arg5;
}

- (void)setArg5:(NSArray *)arg5
{
}

- (NSArray)arg6
{
  return self->_arg6;
}

- (void)setArg6:(NSArray *)arg6
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arg6, 0);
  objc_storeStrong((id *)&self->_arg5, 0);
  objc_storeStrong((id *)&self->_arg4, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);

  objc_storeStrong((id *)&self->_arg1, 0);
}

@end