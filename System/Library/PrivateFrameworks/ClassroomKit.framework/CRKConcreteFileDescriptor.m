@interface CRKConcreteFileDescriptor
- (BOOL)changeFlags:(unsigned int)a3 error:(id *)a4;
- (BOOL)fetchFlags:(unsigned int *)a3 error:(id *)a4;
- (CRKConcreteFileDescriptor)initWithRawValue:(int)a3;
- (NSNumber)backingValue;
- (int)rawValue;
- (void)close;
- (void)dealloc;
- (void)setBackingValue:(id)a3;
@end

@implementation CRKConcreteFileDescriptor

- (void)dealloc
{
  [(CRKConcreteFileDescriptor *)self close];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteFileDescriptor;
  [(CRKConcreteFileDescriptor *)&v3 dealloc];
}

- (CRKConcreteFileDescriptor)initWithRawValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKConcreteFileDescriptor;
  v4 = [(CRKConcreteFileDescriptor *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithInt:v3];
    backingValue = v4->_backingValue;
    v4->_backingValue = (NSNumber *)v5;
  }
  return v4;
}

- (int)rawValue
{
  v4 = [(CRKConcreteFileDescriptor *)self backingValue];

  if (!v4)
  {
    objc_super v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CRKConcreteFileDescriptor.m" lineNumber:45 description:@"Attempted to access raw value after closing file descriptor"];
  }
  uint64_t v5 = [(CRKConcreteFileDescriptor *)self backingValue];
  int v6 = [v5 intValue];

  return v6;
}

- (void)close
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4 = [a2 verboseDescription];
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Failed to close file descriptor. Error: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (BOOL)fetchFlags:(unsigned int *)a3 error:(id *)a4
{
  int v6 = fstat(-[CRKConcreteFileDescriptor rawValue](self, "rawValue", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0),
         &v8);
  if (v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crk_errorWithPOSIXCode:", *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a3)
  {
    *a3 = v8.st_flags;
  }
  return v6 == 0;
}

- (BOOL)changeFlags:(unsigned int)a3 error:(id *)a4
{
  int v5 = fchflags([(CRKConcreteFileDescriptor *)self rawValue], a3);
  int v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crk_errorWithPOSIXCode:", *__error());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (NSNumber)backingValue
{
  return self->_backingValue;
}

- (void)setBackingValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end