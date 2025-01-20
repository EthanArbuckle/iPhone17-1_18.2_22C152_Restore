@interface _SYInputDataItem
- (NSMutableData)data;
- (_SYInputDataItem)initWithLength:(unint64_t)a3 callback:(id)a4;
- (id)callback;
- (os_unfair_lock_s)lock;
- (unint64_t)length;
- (unint64_t)lengthRemaining;
- (void)setCallback:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation _SYInputDataItem

- (_SYInputDataItem)initWithLength:(unint64_t)a3 callback:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SYInputDataItem;
  v7 = [(_SYInputDataItem *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v7->_lock);
    uint64_t v9 = objc_opt_new();
    data = v8->_data;
    v8->_data = (NSMutableData *)v9;

    v8->_length = a3;
    uint64_t v11 = MEMORY[0x21D4B17C0](v6);
    id callback = v8->_callback;
    v8->_id callback = (id)v11;

    os_unfair_lock_unlock(&v8->_lock);
  }

  return v8;
}

- (unint64_t)lengthRemaining
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t length = self->_length;
  unint64_t v5 = length - [(NSMutableData *)self->_data length];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_unint64_t length = a3;
}

- (NSMutableData)data
{
  return self->_data;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end