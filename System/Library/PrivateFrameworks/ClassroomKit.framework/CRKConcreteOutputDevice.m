@interface CRKConcreteOutputDevice
+ (id)outputOptionsWithPassword:(id)a3 suppressPrompt:(BOOL)a4;
- (AVOutputContext)outputContext;
- (AVOutputDevice)outputDevice;
- (CRKConcreteOutputDevice)initWithOutputDevice:(id)a3 outputContext:(id)a4;
- (NSString)identifier;
- (void)displayToDeviceWithPassword:(id)a3 suppressPrompt:(BOOL)a4 completion:(id)a5;
@end

@implementation CRKConcreteOutputDevice

- (CRKConcreteOutputDevice)initWithOutputDevice:(id)a3 outputContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_outputDevice, a3);
    objc_storeStrong((id *)&self->_outputContext, a4);
  }

  return self;
}

- (NSString)identifier
{
  v2 = [(CRKConcreteOutputDevice *)self outputDevice];
  v3 = [v2 deviceID];

  return (NSString *)v3;
}

- (void)displayToDeviceWithPassword:(id)a3 suppressPrompt:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(id)objc_opt_class() outputOptionsWithPassword:v8 suppressPrompt:v6];
  v11 = [(CRKConcreteOutputDevice *)self outputContext];
  v12 = [(CRKConcreteOutputDevice *)self outputDevice];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__CRKConcreteOutputDevice_displayToDeviceWithPassword_suppressPrompt_completion___block_invoke;
  v15[3] = &unk_2646F4360;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v11 setOutputDevice:v12 options:v10 completionHandler:v15];
}

void __81__CRKConcreteOutputDevice_displayToDeviceWithPassword_suppressPrompt_completion___block_invoke(uint64_t a1, void *a2)
{
  extractErrorFromChange(a2, *(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)outputOptionsWithPassword:(id)a3 suppressPrompt:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = objc_opt_new();
  id v7 = [NSNumber numberWithBool:v4];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263EF9FC8]];

  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263EF9FC0]];
  id v8 = (void *)[v6 copy];

  return v8;
}

- (AVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);

  objc_storeStrong((id *)&self->_outputDevice, 0);
}

@end