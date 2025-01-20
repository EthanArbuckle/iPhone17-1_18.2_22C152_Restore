@interface NIAlgorithmConvergenceState
+ (BOOL)supportsSecureCoding;
- (BOOL)insufficientHorizontalSweep;
- (BOOL)insufficientLighting;
- (BOOL)insufficientMovement;
- (BOOL)insufficientSignalStrength;
- (BOOL)insufficientVerticalSweep;
- (BOOL)isEqual:(id)a3;
- (NIAlgorithmConvergenceState)initWithAlgorithmConvergenceState:(id)a3;
- (NIAlgorithmConvergenceState)initWithCoder:(id)a3;
- (NIAlgorithmConvergenceState)initWithConvergenceStatus:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)convergence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConvergence:(int64_t)a3;
- (void)setInsufficientHorizontalSweep:(BOOL)a3;
- (void)setInsufficientLighting:(BOOL)a3;
- (void)setInsufficientMovement:(BOOL)a3;
- (void)setInsufficientSignalStrength:(BOOL)a3;
- (void)setInsufficientVerticalSweep:(BOOL)a3;
@end

@implementation NIAlgorithmConvergenceState

- (NIAlgorithmConvergenceState)initWithConvergenceStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NIAlgorithmConvergenceState;
  result = [(NIAlgorithmConvergenceState *)&v5 init];
  if (result)
  {
    result->_convergence = a3;
    *(_DWORD *)&result->_insufficientSignalStrength = 0;
    result->_insufficientLighting = 0;
  }
  return result;
}

- (NIAlgorithmConvergenceState)initWithAlgorithmConvergenceState:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NIAlgorithmConvergenceState;
  objc_super v5 = [(NIAlgorithmConvergenceState *)&v7 init];
  if (v5)
  {
    v5->_convergence = [v4 convergence];
    v5->_insufficientSignalStrength = [v4 insufficientSignalStrength];
    v5->_insufficientHorizontalSweep = [v4 insufficientHorizontalSweep];
    v5->_insufficientVerticalSweep = [v4 insufficientVerticalSweep];
    v5->_insufficientMovement = [v4 insufficientMovement];
    v5->_insufficientLighting = [v4 insufficientLighting];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithAlgorithmConvergenceState:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_convergence forKey:@"convergence"];
  [v4 encodeBool:self->_insufficientSignalStrength forKey:@"insufficientSignalStrength"];
  [v4 encodeBool:self->_insufficientHorizontalSweep forKey:@"insufficientHorizontalSweep"];
  [v4 encodeBool:self->_insufficientVerticalSweep forKey:@"insufficientVerticalSweep"];
  [v4 encodeBool:self->_insufficientMovement forKey:@"insufficientMovement"];
  [v4 encodeBool:self->_insufficientLighting forKey:@"insufficientLighting"];
}

- (NIAlgorithmConvergenceState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"convergence"];
  char v6 = [v4 decodeBoolForKey:@"insufficientSignalStrength"];
  char v7 = [v4 decodeBoolForKey:@"insufficientHorizontalSweep"];
  char v8 = [v4 decodeBoolForKey:@"insufficientVerticalSweep"];
  char v9 = [v4 decodeBoolForKey:@"insufficientMovement"];
  char v10 = [v4 decodeBoolForKey:@"insufficientLighting"];
  v14.receiver = self;
  v14.super_class = (Class)NIAlgorithmConvergenceState;
  v11 = [(NIAlgorithmConvergenceState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_convergence = v5;
    v11->_insufficientSignalStrength = v6;
    v11->_insufficientHorizontalSweep = v7;
    v11->_insufficientVerticalSweep = v8;
    v11->_insufficientMovement = v9;
    v11->_insufficientLighting = v10;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (NIAlgorithmConvergenceState *)v4;
    char v6 = v5;
    if (v5 == self)
    {
      BOOL v15 = 1;
    }
    else
    {
      int64_t convergence = self->_convergence;
      uint64_t v8 = [(NIAlgorithmConvergenceState *)v5 convergence];
      int insufficientSignalStrength = self->_insufficientSignalStrength;
      int v10 = [(NIAlgorithmConvergenceState *)v6 insufficientSignalStrength];
      int insufficientHorizontalSweep = self->_insufficientHorizontalSweep;
      int v12 = [(NIAlgorithmConvergenceState *)v6 insufficientHorizontalSweep];
      int insufficientVerticalSweep = self->_insufficientVerticalSweep;
      int v13 = [(NIAlgorithmConvergenceState *)v6 insufficientVerticalSweep];
      int insufficientMovement = self->_insufficientMovement;
      int v19 = [(NIAlgorithmConvergenceState *)v6 insufficientMovement];
      int insufficientLighting = self->_insufficientLighting;
      int v14 = [(NIAlgorithmConvergenceState *)v6 insufficientLighting];
      BOOL v15 = 0;
      if (convergence == v8
        && insufficientSignalStrength == v10
        && insufficientHorizontalSweep == v12
        && insufficientVerticalSweep == v13)
      {
        BOOL v15 = insufficientMovement == v19 && insufficientLighting == v14;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_convergence];
  unint64_t v4 = [v3 hash] ^ self->_insufficientSignalStrength ^ (unint64_t)self->_insufficientHorizontalSweep ^ self->_insufficientVerticalSweep ^ self->_insufficientMovement ^ self->_insufficientLighting;

  return v4;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  unint64_t convergence = self->_convergence;
  if (convergence >= 3) {
    __assert_rtn("NIAlgorithmConvergenceStatusToString", "NIAlgorithmConvergenceState.mm", 142, "false");
  }
  [v6 appendFormat:@", Convergence: %@", off_1E5AC2FA0[convergence]];
  if (self->_insufficientSignalStrength) {
    uint64_t v8 = @"yes";
  }
  else {
    uint64_t v8 = @"no";
  }
  [v6 appendFormat:@", insufficientSignalStrength: %@", v8];
  if (self->_insufficientHorizontalSweep) {
    char v9 = @"yes";
  }
  else {
    char v9 = @"no";
  }
  [v6 appendFormat:@", insufficientHorizontalSweep: %@", v9];
  if (self->_insufficientVerticalSweep) {
    int v10 = @"yes";
  }
  else {
    int v10 = @"no";
  }
  [v6 appendFormat:@", insufficientVerticalSweep: %@", v10];
  if (self->_insufficientMovement) {
    v11 = @"yes";
  }
  else {
    v11 = @"no";
  }
  [v6 appendFormat:@", insufficientMovement: %@", v11];
  if (self->_insufficientLighting) {
    int v12 = @"yes";
  }
  else {
    int v12 = @"no";
  }
  [v6 appendFormat:@", insufficientLighting: %@", v12];
  [v6 appendString:@">"];

  return v6;
}

- (int64_t)convergence
{
  return self->_convergence;
}

- (void)setConvergence:(int64_t)a3
{
  self->_unint64_t convergence = a3;
}

- (BOOL)insufficientSignalStrength
{
  return self->_insufficientSignalStrength;
}

- (void)setInsufficientSignalStrength:(BOOL)a3
{
  self->_int insufficientSignalStrength = a3;
}

- (BOOL)insufficientHorizontalSweep
{
  return self->_insufficientHorizontalSweep;
}

- (void)setInsufficientHorizontalSweep:(BOOL)a3
{
  self->_int insufficientHorizontalSweep = a3;
}

- (BOOL)insufficientVerticalSweep
{
  return self->_insufficientVerticalSweep;
}

- (void)setInsufficientVerticalSweep:(BOOL)a3
{
  self->_int insufficientVerticalSweep = a3;
}

- (BOOL)insufficientMovement
{
  return self->_insufficientMovement;
}

- (void)setInsufficientMovement:(BOOL)a3
{
  self->_int insufficientMovement = a3;
}

- (BOOL)insufficientLighting
{
  return self->_insufficientLighting;
}

- (void)setInsufficientLighting:(BOOL)a3
{
  self->_int insufficientLighting = a3;
}

@end