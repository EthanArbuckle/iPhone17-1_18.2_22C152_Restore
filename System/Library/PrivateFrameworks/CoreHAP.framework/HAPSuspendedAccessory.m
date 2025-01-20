@interface HAPSuspendedAccessory
- (HAPSuspendedAccessory)initWithName:(id)a3 identifier:(id)a4 type:(unint64_t)a5 queue:(id)a6;
- (NSString)identifier;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)description;
- (unint64_t)type;
- (void)setQueue:(id)a3;
- (void)wakeWithCompletion:(id)a3;
@end

@implementation HAPSuspendedAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPSuspendedAccessory *)self identifier];
  BOOL v5 = HAPIsInternalBuild();
  if (v5)
  {
    v6 = [(HAPSuspendedAccessory *)self name];
  }
  else
  {
    v6 = @"<private>";
  }
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPSuspendedAccessory type](self, "type"));
  v8 = [v3 stringWithFormat:@"%@/%@/%@", v4, v6, v7];

  if (v5) {

  }
  return v8;
}

- (void)wakeWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HAPSuspendedAccessory)initWithName:(id)a3 identifier:(id)a4 type:(unint64_t)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPSuspendedAccessory;
  v14 = [(HAPSuspendedAccessory *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_identifier, a4);
    v15->_type = a5;
    objc_storeStrong((id *)&v15->_queue, a6);
  }

  return v15;
}

@end