@interface SNClassifySoundRequest
+ (BOOL)supportsSecureCoding;
+ (SNClassifySoundRequest)new;
+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (CMTime)windowDuration;
- (NSArray)knownClassifications;
- (SNClassifySoundRequest)init;
- (SNClassifySoundRequest)initWithClassifierIdentifier:(SNClassifierIdentifier)classifierIdentifier error:(NSError *)error;
- (SNClassifySoundRequest)initWithCoder:(id)a3;
- (SNClassifySoundRequest)initWithImpl:(id)a3;
- (SNClassifySoundRequest)initWithMLModel:(MLModel *)mlModel error:(NSError *)error;
- (SNTimeDurationConstraint)windowDurationConstraint;
- (double)overlapFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)impl;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOverlapFactor:(double)overlapFactor;
- (void)setWindowDuration:(CMTime *)windowDuration;
@end

@implementation SNClassifySoundRequest

- (double)overlapFactor
{
  MEMORY[0x1F4181798](self->_impl, sel_overlapFactor);
  return result;
}

- (void)setOverlapFactor:(double)overlapFactor
{
  impl = self->_impl;
  id v7 = 0;
  BOOL v4 = [(_SNClassifySoundRequest *)impl setOverlapFactor:&v7 error:overlapFactor];
  id v5 = v7;
  if (!v4)
  {
    v6 = +[SNError exceptionFromError:v5];
    [v6 raise];
  }
}

- (CMTime)windowDuration
{
  double result = (CMTime *)self->_impl;
  if (result) {
    return (CMTime *)MEMORY[0x1F4181798](result, sel_windowDuration);
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setWindowDuration:(CMTime *)windowDuration
{
  impl = self->_impl;
  CMTime v4 = *windowDuration;
  [(_SNClassifySoundRequest *)impl setWindowDuration:&v4];
}

- (SNTimeDurationConstraint)windowDurationConstraint
{
  return (SNTimeDurationConstraint *)MEMORY[0x1F4181798](self->_impl, sel_windowDurationConstraint);
}

- (NSArray)knownClassifications
{
  return (NSArray *)MEMORY[0x1F4181798](self->_impl, sel_knownClassifications);
}

- (SNClassifySoundRequest)initWithMLModel:(MLModel *)mlModel error:(NSError *)error
{
  v6 = mlModel;
  v11.receiver = self;
  v11.super_class = (Class)SNClassifySoundRequest;
  id v7 = [(SNClassifySoundRequest *)&v11 init];
  if (v7)
  {
    v8 = [[_SNClassifySoundRequest alloc] initWithMLModel:v6 error:error];
    impl = v7->_impl;
    v7->_impl = v8;

    if (!v7->_impl)
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (SNClassifySoundRequest)initWithClassifierIdentifier:(SNClassifierIdentifier)classifierIdentifier error:(NSError *)error
{
  v6 = classifierIdentifier;
  v11.receiver = self;
  v11.super_class = (Class)SNClassifySoundRequest;
  id v7 = [(SNClassifySoundRequest *)&v11 init];
  if (v7)
  {
    v8 = [[_SNClassifySoundRequest alloc] initWithClassifierIdentifier:v6 error:error];
    impl = v7->_impl;
    v7->_impl = v8;

    if (!v7->_impl)
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (SNClassifySoundRequest)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassifySoundRequest;
  v6 = [(SNClassifySoundRequest *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (SNClassifySoundRequest)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init is not a valid initializer for the class SNClassifySoundRequest" userInfo:0];
  objc_exception_throw(v2);
}

+ (SNClassifySoundRequest)new
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"+new is not a valid class method for the class SNClassifySoundRequest" userInfo:0];
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(_SNClassifySoundRequest *)self->_impl copyWithZone:a3];
  id v7 = (void *)[v5 initWithImpl:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CMTime v4 = (SNClassifySoundRequest *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_SNClassifySoundRequest *)self->_impl isEqual:v4->_impl];
  }

  return v5;
}

- (unint64_t)hash
{
  return MEMORY[0x1F4181798](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNClassifySoundRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassifySoundRequest;
  BOOL v5 = [(SNClassifySoundRequest *)&v9 init];
  if (v5)
  {
    id v6 = [[_SNClassifySoundRequest alloc] initWithCoder:v4];
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)impl
{
  return self->_impl;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1F4181798](_SNClassifySoundRequest, sel_eagerlyAllocateModelsForRequest_error_);
}

- (void).cxx_destruct
{
}

@end