@interface MDMPushServiceConnection
+ (id)connectionWithEnvironment:(unint64_t)a3 channel:(unint64_t)a4 queue:(id)a5;
- (unint64_t)channel;
- (unint64_t)environment;
- (void)requestAppTokenForTopic:(id)a3;
- (void)setChannel:(unint64_t)a3;
- (void)setEnvironment:(unint64_t)a3;
@end

@implementation MDMPushServiceConnection

+ (id)connectionWithEnvironment:(unint64_t)a3 channel:(unint64_t)a4 queue:(id)a5
{
  v8 = (id *)MEMORY[0x263F52E60];
  if (a3) {
    v8 = (id *)MEMORY[0x263F52E58];
  }
  v9 = (id *)MEMORY[0x263F52F30];
  if (a3)
  {
    v9 = (id *)MEMORY[0x263F52F28];
    v10 = (void **)MEMORY[0x263F280C8];
  }
  else
  {
    v10 = (void **)MEMORY[0x263F280D0];
  }
  if (a4) {
    v8 = v9;
  }
  v11 = *v10;
  id v12 = *v8;
  id v13 = v11;
  id v14 = a5;
  v15 = [(APSConnection *)[MDMPushServiceConnection alloc] initWithEnvironmentName:v13 namedDelegatePort:v12 queue:v14];

  [(MDMPushServiceConnection *)v15 setChannel:a4];
  [(MDMPushServiceConnection *)v15 setEnvironment:a3];

  return v15;
}

- (void)requestAppTokenForTopic:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(MDMPushServiceConnection *)self channel];
  v5 = (void *)MEMORY[0x263F52E98];
  if (v4) {
    v5 = (void *)MEMORY[0x263F52F38];
  }
  [(APSConnection *)self requestTokenForTopic:v6 identifier:*v5];
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

@end