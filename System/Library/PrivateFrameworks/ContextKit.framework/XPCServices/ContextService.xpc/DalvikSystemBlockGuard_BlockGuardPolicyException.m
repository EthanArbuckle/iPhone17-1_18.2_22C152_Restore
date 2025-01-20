@interface DalvikSystemBlockGuard_BlockGuardPolicyException
+ (const)__metadata;
- (DalvikSystemBlockGuard_BlockGuardPolicyException)initWithInt:(int)a3 withInt:(int)a4;
- (DalvikSystemBlockGuard_BlockGuardPolicyException)initWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5;
- (id)getMessage;
- (int)getPolicy;
- (int)getPolicyViolation;
- (void)dealloc;
@end

@implementation DalvikSystemBlockGuard_BlockGuardPolicyException

- (DalvikSystemBlockGuard_BlockGuardPolicyException)initWithInt:(int)a3 withInt:(int)a4
{
  *(&self->super.super.super.rawFrameCount + 1) = a3;
  self->mPolicyState_ = a4;
  JreStrongAssign((id *)&self->mMessage_, 0);
  [(JavaLangThrowable *)self fillInStackTrace];
  return self;
}

- (DalvikSystemBlockGuard_BlockGuardPolicyException)initWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5
{
  *(&self->super.super.super.rawFrameCount + 1) = a3;
  self->mPolicyState_ = a4;
  JreStrongAssign((id *)&self->mMessage_, a5);
  [(JavaLangThrowable *)self fillInStackTrace];
  return self;
}

- (int)getPolicy
{
  return *(&self->super.super.super.rawFrameCount + 1);
}

- (int)getPolicyViolation
{
  return self->mPolicyState_;
}

- (id)getMessage
{
  if (self->mMessage_) {
    JreStrcat("$$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @" msg=");
  }
  return (id)JreStrcat("$I$I$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"policy=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DalvikSystemBlockGuard_BlockGuardPolicyException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100444D80;
}

@end