@interface CLSiloIdleHandler
- (CLSiloIdleHandler)initWithIdleHandler:(id)a3 onResume:(id)a4;
- (id)onIdle;
- (id)onResume;
- (void)invalidate;
- (void)setOnIdle:(id)a3;
- (void)setOnResume:(id)a3;
@end

@implementation CLSiloIdleHandler

- (CLSiloIdleHandler)initWithIdleHandler:(id)a3 onResume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLSiloIdleHandler;
  v8 = [(CLSiloIdleHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CLSiloIdleHandler *)v8 setOnIdle:v6];
    [(CLSiloIdleHandler *)v9 setOnResume:v7];
  }

  return v9;
}

- (void)invalidate
{
  [(CLSiloIdleHandler *)self setOnIdle:0];
  [(CLSiloIdleHandler *)self setOnResume:0];
}

- (id)onIdle
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOnIdle:(id)a3
{
}

- (id)onResume
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOnResume:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onResume, 0);
  objc_storeStrong(&self->_onIdle, 0);
}

@end