@interface SecLaunchEvent
- (NSDate)date;
- (NSString)name;
- (SecLaunchEvent)initWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)counter;
- (void)setCounter:(unsigned int)a3;
- (void)setDate:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SecLaunchEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(SecLaunchEvent *)self name];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setName:v7];

  v8 = [(SecLaunchEvent *)self date];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDate:v9];

  objc_msgSend(v5, "setCounter:", -[SecLaunchEvent counter](self, "counter"));
  return v5;
}

- (SecLaunchEvent)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SecLaunchEvent;
  v6 = [(SecLaunchEvent *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    date = v7->_date;
    v7->_date = (NSDate *)v8;

    v7->_counter = 1;
  }

  return v7;
}

@end