@interface CAMSystemPressureState
- (AVCaptureSystemPressureState)_underlyingSystemPressureState;
- (BOOL)isCameraTooHot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSystemPressureState:(id)a3;
- (CAMSystemPressureState)initWithCaptureSystemPressureState:(id)a3;
- (id)description;
@end

@implementation CAMSystemPressureState

- (CAMSystemPressureState)initWithCaptureSystemPressureState:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMSystemPressureState;
  v6 = [(CAMSystemPressureState *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__underlyingSystemPressureState, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CAMSystemPressureState *)self isEqualToSystemPressureState:v4];

  return v5;
}

- (BOOL)isEqualToSystemPressureState:(id)a3
{
  id v4 = (CAMSystemPressureState *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    goto LABEL_6;
  }
  v6 = [(CAMSystemPressureState *)v4 _underlyingSystemPressureState];
  if (!v6)
  {
    v7 = [(CAMSystemPressureState *)self _underlyingSystemPressureState];

    if (v7) {
      goto LABEL_5;
    }
LABEL_6:
    char v10 = 1;
    goto LABEL_7;
  }

LABEL_5:
  v8 = [(CAMSystemPressureState *)v5 _underlyingSystemPressureState];
  v9 = [(CAMSystemPressureState *)self _underlyingSystemPressureState];
  char v10 = [v8 isEqual:v9];

LABEL_7:
  return v10;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAMSystemPressureState;
  id v4 = [(CAMSystemPressureState *)&v8 description];
  BOOL v5 = [(CAMSystemPressureState *)self _underlyingSystemPressureState];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (BOOL)isCameraTooHot
{
  v2 = [(CAMSystemPressureState *)self _underlyingSystemPressureState];
  if (([v2 factors] & 8) != 0)
  {
    id v4 = [v2 level];
    char v3 = [v4 isEqualToString:*MEMORY[0x263EF97C0]];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (AVCaptureSystemPressureState)_underlyingSystemPressureState
{
  return self->__underlyingSystemPressureState;
}

- (void).cxx_destruct
{
}

@end