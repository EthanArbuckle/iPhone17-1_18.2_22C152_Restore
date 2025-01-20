@interface CATMutableTaskProgress
- (CATMutableTaskProgress)initWithCoder:(id)a3;
- (CATMutableTaskProgress)initWithOperationUUID:(id)a3;
- (CATMutableTaskProgress)initWithOperationUUID:(id)a3 requestClass:(Class)a4;
- (void)setProgress:(id)a3;
- (void)setResultObject:(id)a3;
@end

@implementation CATMutableTaskProgress

- (CATMutableTaskProgress)initWithOperationUUID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CATMutableTaskProgress;
  return [(CATTaskProgress *)&v4 initWithOperationUUID:a3];
}

- (CATMutableTaskProgress)initWithOperationUUID:(id)a3 requestClass:(Class)a4
{
  id v7 = a3;
  if (!a4)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CATTaskProgress.m", 306, @"Invalid parameter not satisfying: %@", @"requestClass" object file lineNumber description];
  }
  v8 = [(CATMutableTaskProgress *)self initWithOperationUUID:v7];
  if (v8)
  {
    v9 = NSStringFromClass(a4);
    [(CATTaskProgress *)v8 setRequestClassName:v9];
  }
  return v8;
}

- (CATMutableTaskProgress)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CATMutableTaskProgress;
  return [(CATTaskProgress *)&v4 initWithCoder:a3];
}

- (void)setResultObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CATMutableTaskProgress;
  [(CATTaskProgress *)&v7 setResultObject:a3];
  objc_super v4 = objc_opt_class();
  v5 = [(CATTaskProgress *)self resultObject];
  v6 = [(CATTaskProgress *)self requestClassName];
  [v4 assertResultObject:v5 isValidForRequestClassName:v6];
}

- (void)setProgress:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CATMutableTaskProgress;
  [(CATTaskProgress *)&v3 setProgress:a3];
}

@end