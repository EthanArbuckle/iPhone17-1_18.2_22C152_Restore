@interface ASDTIOService
+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (ASDTIOServiceID)idValue;
- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (unsigned)ioObject;
- (void)dealloc;
- (void)releaseIOService;
- (void)retainIOService;
- (void)setIdValue:(id)a3;
- (void)setIoObject:(unsigned int)a3;
@end

@implementation ASDTIOService

+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initForIOObject:v4 andIDValue:v6];

  return v7;
}

- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  v8 = v7;
  if (!v4 || !v7)
  {
    v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOService initForIOObject:andIDValue:](v9);
    }

    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"ASDTIOService.m" lineNumber:39 description:@"Invalid arugments."];
  }
  v14.receiver = self;
  v14.super_class = (Class)ASDTIOService;
  v11 = [(ASDTIOService *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ASDTIOService *)v11 setIdValue:v8];
    [(ASDTIOService *)v12 setIoObject:v4];
    [(ASDTIOService *)v12 retainIOService];
  }

  return v12;
}

- (void)dealloc
{
  [(ASDTIOService *)self releaseIOService];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOService;
  [(ASDTIOService *)&v3 dealloc];
}

- (void)retainIOService
{
  io_object_t v2 = [(ASDTIOService *)self ioObject];
  IOObjectRetain(v2);
}

- (void)releaseIOService
{
  if ([(ASDTIOService *)self ioObject])
  {
    io_object_t v3 = [(ASDTIOService *)self ioObject];
    IOObjectRelease(v3);
  }
}

- (unsigned)ioObject
{
  return self->_ioObject;
}

- (void)setIoObject:(unsigned int)a3
{
  self->_ioObject = a3;
}

- (ASDTIOServiceID)idValue
{
  return self->_idValue;
}

- (void)setIdValue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initForIOObject:(os_log_t)log andIDValue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Invalid arugments.", v1, 2u);
}

@end