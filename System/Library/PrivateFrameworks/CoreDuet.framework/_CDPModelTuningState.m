@interface _CDPModelTuningState
+ (BOOL)supportsSecureCoding;
+ (id)initialTuningState;
- (_CDPModelTuningState)initWithCoder:(id)a3;
- (float)bestLogLambda;
- (float)bestScore;
- (float)bestThreshold;
- (float)bestW0;
- (float)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)i;
- (int)j;
- (void)encodeWithCoder:(id)a3;
- (void)setBestLogLambda:(float)a3;
- (void)setBestScore:(float)a3;
- (void)setBestThreshold:(float)a3;
- (void)setBestW0:(float)a3;
- (void)setI:(int)a3;
- (void)setJ:(int)a3;
@end

@implementation _CDPModelTuningState

+ (id)initialTuningState
{
  id v2 = objc_alloc_init((Class)a1);
  LODWORD(v3) = -1.0;
  [v2 setBestScore:v3];
  return v2;
}

- (_CDPModelTuningState)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_CDPModelTuningState;
  id v3 = a3;
  v4 = [(_CDPModelTuningState *)&v9 init];
  -[_CDPModelTuningState setI:](v4, "setI:", objc_msgSend(v3, "decodeIntForKey:", @"i", v9.receiver, v9.super_class));
  -[_CDPModelTuningState setJ:](v4, "setJ:", [v3 decodeIntForKey:@"j"]);
  [v3 decodeFloatForKey:@"bestLogLambda"];
  -[_CDPModelTuningState setBestLogLambda:](v4, "setBestLogLambda:");
  [v3 decodeFloatForKey:@"bestW0"];
  -[_CDPModelTuningState setBestW0:](v4, "setBestW0:");
  [v3 decodeFloatForKey:@"bestScore"];
  -[_CDPModelTuningState setBestScore:](v4, "setBestScore:");
  [v3 decodeFloatForKey:@"bestThreshold"];
  int v6 = v5;

  LODWORD(v7) = v6;
  [(_CDPModelTuningState *)v4 setBestThreshold:v7];
  return v4;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@ %p:i=%d,j=%d,bestScore=%g,bestLogLambda=%g,bestW0=%g,bestThreshold=%g>", v5, self, self->_i, self->_j, self->_bestScore, self->_bestLogLambda, self->_bestW0, self->_bestThreshold];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[_CDPModelTuningState i](self, "i"), @"i");
  objc_msgSend(v4, "encodeInt:forKey:", -[_CDPModelTuningState j](self, "j"), @"j");
  [(_CDPModelTuningState *)self bestLogLambda];
  objc_msgSend(v4, "encodeFloat:forKey:", @"bestLogLambda");
  [(_CDPModelTuningState *)self bestW0];
  objc_msgSend(v4, "encodeFloat:forKey:", @"bestW0");
  [(_CDPModelTuningState *)self bestScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"bestScore");
  [(_CDPModelTuningState *)self bestThreshold];
  objc_msgSend(v4, "encodeFloat:forKey:", @"bestThreshold");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_CDPModelTuningState initialTuningState];
  objc_msgSend(v4, "setI:", -[_CDPModelTuningState i](self, "i"));
  objc_msgSend(v4, "setJ:", -[_CDPModelTuningState j](self, "j"));
  [(_CDPModelTuningState *)self bestLogLambda];
  objc_msgSend(v4, "setBestLogLambda:");
  [(_CDPModelTuningState *)self bestW0];
  objc_msgSend(v4, "setBestW0:");
  [(_CDPModelTuningState *)self bestScore];
  objc_msgSend(v4, "setBestScore:");
  [(_CDPModelTuningState *)self bestThreshold];
  objc_msgSend(v4, "setBestThreshold:");
  return v4;
}

- (float)progress
{
  int v3 = 9 * [(_CDPModelTuningState *)self i];
  return (float)([(_CDPModelTuningState *)self j] + v3 + 1) / 81.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)i
{
  return self->_i;
}

- (void)setI:(int)a3
{
  self->_i = a3;
}

- (int)j
{
  return self->_j;
}

- (void)setJ:(int)a3
{
  self->_j = a3;
}

- (float)bestLogLambda
{
  return self->_bestLogLambda;
}

- (void)setBestLogLambda:(float)a3
{
  self->_bestLogLambda = a3;
}

- (float)bestW0
{
  return self->_bestW0;
}

- (void)setBestW0:(float)a3
{
  self->_bestW0 = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (float)bestThreshold
{
  return self->_bestThreshold;
}

- (void)setBestThreshold:(float)a3
{
  self->_bestThreshold = a3;
}

@end