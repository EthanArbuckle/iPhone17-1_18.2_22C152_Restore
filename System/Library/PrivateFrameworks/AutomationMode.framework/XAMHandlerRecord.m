@interface XAMHandlerRecord
- (id)initWithQueue:(void *)a3 block:;
@end

@implementation XAMHandlerRecord

- (id)initWithQueue:(void *)a3 block:
{
  id v6 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)XAMHandlerRecord;
    id v7 = a3;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    objc_storeStrong(v8 + 1, a2);
    uint64_t v9 = objc_msgSend(v7, "copy", v12.receiver, v12.super_class);

    id v10 = v8[2];
    v8[2] = (id)v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end