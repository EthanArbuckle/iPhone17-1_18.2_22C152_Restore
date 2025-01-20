@interface ODRMaintenanceTask
- (void)main;
@end

@implementation ODRMaintenanceTask

- (void)main
{
  v3 = objc_opt_new();
  id v10 = 0;
  unsigned __int8 v4 = [(Task *)self runSubTask:v3 returningError:&v10];
  id v5 = v10;

  if (v4)
  {
    v6 = objc_opt_new();
    id v9 = v5;
    unsigned __int8 v7 = [(Task *)self runSubTask:v6 returningError:&v9];
    id v8 = v9;

    if (v7) {
      [(Task *)self completeWithSuccess];
    }
    else {
      [(Task *)self completeWithError:v8];
    }
    id v5 = v8;
  }
  else
  {
    [(Task *)self completeWithError:v5];
  }
}

@end