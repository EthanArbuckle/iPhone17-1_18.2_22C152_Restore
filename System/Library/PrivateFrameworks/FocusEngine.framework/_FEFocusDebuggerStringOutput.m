@interface _FEFocusDebuggerStringOutput
+ (id)outputWithString:(id)a3;
- (NSString)description;
- (_FEFocusDebuggerStringOutput)init;
- (_FEFocusDebuggerStringOutput)initWithString:(id)a3;
@end

@implementation _FEFocusDebuggerStringOutput

+ (id)outputWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (_FEFocusDebuggerStringOutput)init
{
  return [(_FEFocusDebuggerStringOutput *)self initWithString:&stru_2700CBC00];
}

- (_FEFocusDebuggerStringOutput)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_FEFocusDebugger.m", 72, @"Invalid parameter not satisfying: %@", @"outputString" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_FEFocusDebuggerStringOutput;
  v6 = [(_FEFocusDebuggerStringOutput *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    outputString = v6->_outputString;
    v6->_outputString = (NSString *)v7;
  }
  return v6;
}

- (NSString)description
{
  if (self->_outputString) {
    return self->_outputString;
  }
  else {
    return (NSString *)&stru_2700CBC00;
  }
}

- (void).cxx_destruct
{
}

@end