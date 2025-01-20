@interface CCSModulePresentationOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
- (BOOL)animateDismissal;
- (BOOL)animatePresentation;
- (BOOL)blurBackground;
- (BOOL)isEqual:(id)a3;
- (CCSModulePresentationOptions)initWithBlurBackground:(BOOL)a3 animatePresentation:(BOOL)a4 animateDismissal:(BOOL)a5;
- (CCSModulePresentationOptions)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCSModulePresentationOptions

+ (id)defaultOptions
{
  v2 = (void *)[objc_alloc((Class)a1) initWithBlurBackground:1 animatePresentation:1 animateDismissal:1];

  return v2;
}

- (CCSModulePresentationOptions)initWithBlurBackground:(BOOL)a3 animatePresentation:(BOOL)a4 animateDismissal:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CCSModulePresentationOptions;
  result = [(CCSModulePresentationOptions *)&v9 init];
  if (result)
  {
    result->_blurBackground = a3;
    result->_animatePresentation = a4;
    result->_animateDismissal = a5;
  }
  return result;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendBool:self->_blurBackground];
  id v5 = (id)[v3 appendBool:self->_animatePresentation];
  id v6 = (id)[v3 appendBool:self->_animateDismissal];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(CCSModulePresentationOptions *)self blurBackground];
    int v7 = v6 ^ [v5 blurBackground];
    int v8 = [(CCSModulePresentationOptions *)self animatePresentation];
    int v9 = v7 | v8 ^ [v5 animatePresentation];
    BOOL v10 = [(CCSModulePresentationOptions *)self animateDismissal];
    LOBYTE(v8) = [v5 animateDismissal];

    char v11 = (v9 | v10 ^ v8) ^ 1;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_blurBackground withName:@"blurBackground"];
  id v5 = (id)[v3 appendBool:self->_animatePresentation withName:@"animatePresentation"];
  id v6 = (id)[v3 appendBool:self->_animateDismissal withName:@"animateDismissal"];
  int v7 = [v3 build];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CCSModulePresentationOptions blurBackground](self, "blurBackground"), @"blurBackground");
  objc_msgSend(v4, "encodeBool:forKey:", -[CCSModulePresentationOptions animatePresentation](self, "animatePresentation"), @"animatePresentation");
  objc_msgSend(v4, "encodeBool:forKey:", -[CCSModulePresentationOptions animateDismissal](self, "animateDismissal"), @"animateDismissal");
}

- (CCSModulePresentationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"blurBackground"];
  uint64_t v6 = [v4 decodeBoolForKey:@"animatePresentation"];
  uint64_t v7 = [v4 decodeBoolForKey:@"animateDismissal"];

  return [(CCSModulePresentationOptions *)self initWithBlurBackground:v5 animatePresentation:v6 animateDismissal:v7];
}

- (BOOL)animatePresentation
{
  return self->_animatePresentation;
}

- (BOOL)animateDismissal
{
  return self->_animateDismissal;
}

- (BOOL)blurBackground
{
  return self->_blurBackground;
}

@end