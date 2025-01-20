@interface HMMTRAccessoryPairingEndContext
+ (id)hapContextWithStep:(unint64_t)a3 error:(id)a4;
+ (id)hmmtrContextWithCancelledError:(id)a3;
+ (id)hmmtrContextWithStep:(unint64_t)a3 error:(id)a4;
+ (id)mtrContextWithStep:(unint64_t)a3 error:(id)a4;
+ (id)otherContextWithStep:(unint64_t)a3 error:(id)a4;
- (HMMTRAccessoryPairingEndContext)initWithStep:(id)a3 error:(id)a4 sourceErrorDomain:(id)a5;
- (NSError)error;
- (NSNumber)step;
- (NSString)sourceErrorDomain;
- (id)attributeDescriptions;
@end

@implementation HMMTRAccessoryPairingEndContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceErrorDomain, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_step, 0);
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
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMMTRAccessoryPairingEndContext *)self step];
  v5 = HMMTRAccessoryPairingStepAsString([v4 unsignedIntValue]);
  v6 = (void *)[v3 initWithName:@"Step" value:v5];
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMMTRAccessoryPairingEndContext *)self error];
  v9 = (void *)[v7 initWithName:@"Error" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMMTRAccessoryPairingEndContext *)self sourceErrorDomain];
  v12 = (void *)[v10 initWithName:@"SourceErrorDomain" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMMTRAccessoryPairingEndContext)initWithStep:(id)a3 error:(id)a4 sourceErrorDomain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMMTRAccessoryPairingEndContext;
  v12 = [(HMMTRAccessoryPairingEndContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_step, a3);
    uint64_t v14 = [v10 copy];
    error = v13->_error;
    v13->_error = (NSError *)v14;

    objc_storeStrong((id *)&v13->_sourceErrorDomain, a5);
  }

  return v13;
}

+ (id)otherContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v5 domain];
  id v9 = [(HMMTRAccessoryPairingEndContext *)v6 initWithStep:v7 error:v5 sourceErrorDomain:v8];

  return v9;
}

+ (id)hmmtrContextWithCancelledError:(id)a3
{
  id v3 = a3;
  v4 = [[HMMTRAccessoryPairingEndContext alloc] initWithStep:0 error:v3 sourceErrorDomain:@"HMMTRErrorDomain"];

  return v4;
}

+ (id)mtrContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(HMMTRAccessoryPairingEndContext *)v6 initWithStep:v7 error:v5 sourceErrorDomain:*MEMORY[0x263F10BB0]];

  return v8;
}

+ (id)hmmtrContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(HMMTRAccessoryPairingEndContext *)v6 initWithStep:v7 error:v5 sourceErrorDomain:@"HMMTRErrorDomain"];

  return v8;
}

+ (id)hapContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(HMMTRAccessoryPairingEndContext *)v6 initWithStep:v7 error:v5 sourceErrorDomain:*MEMORY[0x263F355F0]];

  return v8;
}

@end