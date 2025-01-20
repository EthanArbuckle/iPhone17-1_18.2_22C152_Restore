@interface _GCKeyboardEventImpl
- (_GCKeyboardEventImpl)init;
- (_GCKeyboardEventImpl)initWithKeyboardEvent:(id)a3;
- (_GCKeyboardEventImpl)initWithTimestamp:(unint64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 down:(int64_t)a6 sender:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)down;
- (int64_t)usage;
- (int64_t)usagePage;
- (unint64_t)sender;
- (unint64_t)timestamp;
- (void)setDown:(int64_t)a3;
- (void)setSender:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUsage:(int64_t)a3;
- (void)setUsagePage:(int64_t)a3;
@end

@implementation _GCKeyboardEventImpl

- (_GCKeyboardEventImpl)init
{
  return [(_GCKeyboardEventImpl *)self initWithTimestamp:0 usagePage:0 usage:0 down:0 sender:0];
}

- (_GCKeyboardEventImpl)initWithKeyboardEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 timestamp];
  uint64_t v6 = [v4 usagePage];
  uint64_t v7 = [v4 usage];
  uint64_t v8 = [v4 down];
  uint64_t v9 = [v4 sender];

  return [(_GCKeyboardEventImpl *)self initWithTimestamp:v5 usagePage:v6 usage:v7 down:v8 sender:v9];
}

- (_GCKeyboardEventImpl)initWithTimestamp:(unint64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 down:(int64_t)a6 sender:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)_GCKeyboardEventImpl;
  result = [(_GCKeyboardEventImpl *)&v13 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_usagePage = a4;
    result->_usage = a5;
    result->_down = a6;
    result->_sender = a7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id result = (id)objc_opt_new();
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_timestamp;
  *((void *)result + 3) = self->_usage;
  *((_OWORD *)result + 2) = *(_OWORD *)&self->_down;
  return result;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(int64_t)a3
{
  self->_usagePage = a3;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (int64_t)down
{
  return self->_down;
}

- (void)setDown:(int64_t)a3
{
  self->_down = a3;
}

- (unint64_t)sender
{
  return self->_sender;
}

- (void)setSender:(unint64_t)a3
{
  self->_sender = a3;
}

@end