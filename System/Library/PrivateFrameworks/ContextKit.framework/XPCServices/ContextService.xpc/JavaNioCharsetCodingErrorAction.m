@interface JavaNioCharsetCodingErrorAction
+ (const)__metadata;
+ (void)initialize;
- (JavaNioCharsetCodingErrorAction)initWithNSString:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation JavaNioCharsetCodingErrorAction

- (JavaNioCharsetCodingErrorAction)initWithNSString:(id)a3
{
  return self;
}

- (id)description
{
  return (id)JreStrcat("$$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"Action: ");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetCodingErrorAction;
  [(JavaNioCharsetCodingErrorAction *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [JavaNioCharsetCodingErrorAction alloc];
    JreStrongAssign((id *)&v2->action_, @"IGNORE");
    JreStrongAssignAndConsume(&JavaNioCharsetCodingErrorAction_IGNORE_, v2);
    objc_super v3 = [JavaNioCharsetCodingErrorAction alloc];
    JreStrongAssign((id *)&v3->action_, @"REPLACE");
    JreStrongAssignAndConsume((id *)&JavaNioCharsetCodingErrorAction_REPLACE_, v3);
    uint64_t v4 = [JavaNioCharsetCodingErrorAction alloc];
    JreStrongAssign((id *)&v4->action_, @"REPORT");
    JreStrongAssignAndConsume((id *)&JavaNioCharsetCodingErrorAction_REPORT_, v4);
    atomic_store(1u, (unsigned __int8 *)JavaNioCharsetCodingErrorAction__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004583F8;
}

@end