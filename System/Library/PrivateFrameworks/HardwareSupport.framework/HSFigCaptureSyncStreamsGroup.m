@interface HSFigCaptureSyncStreamsGroup
+ (id)statusDescription:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStreamsGroup:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4 error:(id *)a5;
- (HSFigCaptureDevice)device;
- (HSFigCaptureSyncStreamsGroup)initWithCaptureSyncStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 fromDevice:(id)a4;
- (OpaqueFigCaptureSynchronizedStreamsGroup)underlyingSyncStreamsGroup;
- (id)description;
- (id)streams:(id *)a3;
- (id)valueForKey:(id)a3;
- (id)valueForProperty:(__CFString *)a3 error:(id *)a4;
- (unint64_t)hash;
@end

@implementation HSFigCaptureSyncStreamsGroup

+ (id)statusDescription:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = __HSDescribeFigStreamStatus(a3);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HSFigCaptureSyncStreamsGroup;
    objc_msgSendSuper2(&v10, sel_statusDescription_, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (HSFigCaptureSyncStreamsGroup)initWithCaptureSyncStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 fromDevice:(id)a4
{
  v6 = (HSFigCaptureDevice *)a4;
  uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  v11.receiver = self;
  v11.super_class = (Class)HSFigCaptureSyncStreamsGroup;
  v8 = [(HSCMBaseObject *)&v11 initWithBaseObject:FigBaseObject];
  v8->_underlyingSyncStreamsGroup = a3;
  device = v8->_device;
  v8->_device = v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HSFigCaptureSyncStreamsGroup *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HSFigCaptureSyncStreamsGroup *)self isEqualToStreamsGroup:v4];
  }

  return v5;
}

- (BOOL)isEqualToStreamsGroup:(id)a3
{
  v4 = (OpaqueFigCaptureSynchronizedStreamsGroup *)[a3 underlyingSyncStreamsGroup];
  return v4 == [(HSFigCaptureSyncStreamsGroup *)self underlyingSyncStreamsGroup];
}

- (unint64_t)hash
{
  return CFHash(self->_underlyingSyncStreamsGroup);
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HSFigCaptureSyncStreamsGroup;
  v4 = [(HSFigCaptureSyncStreamsGroup *)&v10 description];
  underlyingSyncStreamsGroup = self->_underlyingSyncStreamsGroup;
  v6 = [(HSFigCaptureSyncStreamsGroup *)self device];
  id v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"%@ [streamsGroupRef: %p, device: %@]", v4, underlyingSyncStreamsGroup, v7];

  return v8;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSStringFromSelector(sel_underlyingSyncStreamsGroup);
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = self->_underlyingSyncStreamsGroup;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HSFigCaptureSyncStreamsGroup;
    id v7 = [(HSFigCaptureSyncStreamsGroup *)&v10 valueForKey:v4];
  }
  v8 = v7;

  return v8;
}

- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4 error:(id *)a5
{
  v8 = _unwrapFigCaptureValue(a3);
  v10.receiver = self;
  v10.super_class = (Class)HSFigCaptureSyncStreamsGroup;
  LOBYTE(a5) = [(HSCMBaseObject *)&v10 setValue:v8 forProperty:a4 error:a5];

  return (char)a5;
}

- (id)valueForProperty:(__CFString *)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HSFigCaptureSyncStreamsGroup;
  BOOL v5 = [(HSCMBaseObject *)&v8 valueForProperty:a3 error:a4];
  int v6 = _wrapFigCaptureValue(v5, self->_device);

  return v6;
}

- (id)streams:(id *)a3
{
  return [(HSFigCaptureSyncStreamsGroup *)self valueForProperty:*MEMORY[0x263F2EB80] error:a3];
}

- (HSFigCaptureDevice)device
{
  return self->_device;
}

- (OpaqueFigCaptureSynchronizedStreamsGroup)underlyingSyncStreamsGroup
{
  return self->_underlyingSyncStreamsGroup;
}

- (void).cxx_destruct
{
}

@end