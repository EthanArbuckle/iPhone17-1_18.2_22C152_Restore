@interface _CNSuddenTerminationInhibitor
- (NSProcessInfo)processInfo;
- (_CNSuddenTerminationInhibitor)init;
- (_CNSuddenTerminationInhibitor)initWithProcessInfo:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _CNSuddenTerminationInhibitor

- (_CNSuddenTerminationInhibitor)init
{
  v3 = [MEMORY[0x1E4F28F80] processInfo];
  v4 = [(_CNSuddenTerminationInhibitor *)self initWithProcessInfo:v3];

  return v4;
}

- (_CNSuddenTerminationInhibitor)initWithProcessInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNSuddenTerminationInhibitor;
  v6 = [(_CNSuddenTerminationInhibitor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)start
{
  v2.receiver = self;
  v2.super_class = (Class)_CNSuddenTerminationInhibitor;
  [(CNInhibitor *)&v2 start];
}

- (void)stop
{
  v2.receiver = self;
  v2.super_class = (Class)_CNSuddenTerminationInhibitor;
  [(CNInhibitor *)&v2 stop];
}

- (NSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end