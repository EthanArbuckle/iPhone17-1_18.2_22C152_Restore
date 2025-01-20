@interface HMDMatterAccessoryPairingEndContext
+ (id)contextFromMTRContext:(id)a3;
+ (id)hmContextWithCancelledError:(id)a3;
+ (id)hmdContextWithCancelledError:(id)a3;
+ (id)hmdContextWithStep:(unint64_t)a3 error:(id)a4;
+ (id)hmmtrContextWithStep:(unint64_t)a3 error:(id)a4;
+ (id)pairingCompletedContext;
- (BOOL)isCancelled;
- (HMDMatterAccessoryPairingEndContext)initWithStep:(id)a3 error:(id)a4 sourceErrorDomain:(id)a5 isCancelled:(BOOL)a6;
- (NSError)error;
- (NSNumber)step;
- (NSString)sourceErrorDomain;
- (id)attributeDescriptions;
@end

@implementation HMDMatterAccessoryPairingEndContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceErrorDomain, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (NSString)sourceErrorDomain
{
  return self->_sourceErrorDomain;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)step
{
  return self->_step;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDMatterAccessoryPairingEndContext *)self step];
  v5 = HMDMatterAccessoryPairingStepAsString([v4 unsignedIntValue]);
  v6 = (void *)[v3 initWithName:@"Step" value:v5];
  v18[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDMatterAccessoryPairingEndContext *)self error];
  v9 = (void *)[v7 initWithName:@"Error" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDMatterAccessoryPairingEndContext *)self sourceErrorDomain];
  v12 = (void *)[v10 initWithName:@"SourceErrorDomain" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDMatterAccessoryPairingEndContext *)self isCancelled];
  v14 = HMFBooleanToString();
  v15 = (void *)[v13 initWithName:@"IsCancelled" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

- (HMDMatterAccessoryPairingEndContext)initWithStep:(id)a3 error:(id)a4 sourceErrorDomain:(id)a5 isCancelled:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDMatterAccessoryPairingEndContext;
  v14 = [(HMDMatterAccessoryPairingEndContext *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_step, a3);
    uint64_t v16 = [v12 copy];
    error = v15->_error;
    v15->_error = (NSError *)v16;

    objc_storeStrong((id *)&v15->_sourceErrorDomain, a5);
    v15->_isCancelled = a6;
  }

  return v15;
}

+ (id)hmmtrContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [HMDMatterAccessoryPairingEndContext alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(HMDMatterAccessoryPairingEndContext *)v6 initWithStep:v7 error:v5 sourceErrorDomain:*MEMORY[0x263F49710] isCancelled:0];

  return v8;
}

+ (id)hmdContextWithCancelledError:(id)a3
{
  id v3 = a3;
  v4 = [[HMDMatterAccessoryPairingEndContext alloc] initWithStep:0 error:v3 sourceErrorDomain:@"HMDErrorDomain" isCancelled:1];

  return v4;
}

+ (id)hmdContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [HMDMatterAccessoryPairingEndContext alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(HMDMatterAccessoryPairingEndContext *)v6 initWithStep:v7 error:v5 sourceErrorDomain:@"HMDErrorDomain" isCancelled:0];

  return v8;
}

+ (id)hmContextWithCancelledError:(id)a3
{
  id v3 = a3;
  v4 = [HMDMatterAccessoryPairingEndContext alloc];
  id v5 = [(HMDMatterAccessoryPairingEndContext *)v4 initWithStep:0 error:v3 sourceErrorDomain:*MEMORY[0x263F0C710] isCancelled:1];

  return v5;
}

+ (id)pairingCompletedContext
{
  v2 = [[HMDMatterAccessoryPairingEndContext alloc] initWithStep:&unk_26E471110 error:0 sourceErrorDomain:0 isCancelled:0];
  return v2;
}

+ (id)contextFromMTRContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 step];

  id v5 = [v3 step];
  unsigned int v6 = [v5 unsignedIntValue];

  id v7 = [HMDMatterAccessoryPairingEndContext alloc];
  v8 = [v3 step];
  if (v8)
  {
    if ((unint64_t)v6 - 1 < 0x16) {
      uint64_t v9 = v6 + 1;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = [NSNumber numberWithUnsignedInteger:v9];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [v3 error];
  id v12 = [v3 sourceErrorDomain];
  id v13 = [(HMDMatterAccessoryPairingEndContext *)v7 initWithStep:v10 error:v11 sourceErrorDomain:v12 isCancelled:v4 == 0];

  if (v8) {
  return v13;
  }
}

@end