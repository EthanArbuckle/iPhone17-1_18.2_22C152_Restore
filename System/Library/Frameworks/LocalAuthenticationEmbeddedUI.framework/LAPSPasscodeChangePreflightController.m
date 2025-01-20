@interface LAPSPasscodeChangePreflightController
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (LAPSPasscodeChangePreflightController)initWithSystem:(id)a3;
- (id)lastPasscodeChange;
@end

@implementation LAPSPasscodeChangePreflightController

- (LAPSPasscodeChangePreflightController)initWithSystem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangePreflightController;
  v6 = [(LAPSPasscodeChangePreflightController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_system, a3);
  }

  return v7;
}

- (id)lastPasscodeChange
{
  return (id)[(LAPSPasscodeChangeSystem *)self->_system lastPasscodeChange];
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return [(LAPSPasscodeChangeSystem *)self->_system canChangePasscodeWithError:a3];
}

- (void).cxx_destruct
{
}

@end