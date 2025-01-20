@interface DTTapStatusMemo
- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4;
- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4 info:(id)a5;
- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4 info:(id)a5 timestamp:(unint64_t)a6;
- (NSDictionary)info;
- (NSString)notice;
- (unint64_t)timestamp;
- (unsigned)status;
- (void)setInfo:(id)a3;
- (void)setNotice:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation DTTapStatusMemo

- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [(DTTapStatusMemo *)self initWithStatus:v4 notice:v6 info:0 timestamp:mach_absolute_time()];

  return v7;
}

- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4 info:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [(DTTapStatusMemo *)self initWithStatus:v6 notice:v9 info:v8 timestamp:mach_absolute_time()];

  return v10;
}

- (DTTapStatusMemo)initWithStatus:(unsigned int)a3 notice:(id)a4 info:(id)a5 timestamp:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DTTapStatusMemo;
  id v13 = [(DTTapStatusMemo *)&v16 init];
  v14 = (DTTapStatusMemo *)v13;
  if (v13)
  {
    *((_DWORD *)v13 + 3) = a3;
    objc_storeStrong((id *)v13 + 3, a4);
    objc_storeStrong((id *)&v14->_notice, a5);
    *(void *)&v14->_status = a6;
  }

  return v14;
}

- (unsigned)status
{
  return *(&self->super._tapVersion + 1);
}

- (void)setStatus:(unsigned int)a3
{
  *(&self->super._tapVersion + 1) = a3;
}

- (unint64_t)timestamp
{
  return *(void *)&self->_status;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_status = a3;
}

- (NSString)notice
{
  return (NSString *)self->_timestamp;
}

- (void)setNotice:(id)a3
{
}

- (NSDictionary)info
{
  return (NSDictionary *)self->_notice;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notice, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end