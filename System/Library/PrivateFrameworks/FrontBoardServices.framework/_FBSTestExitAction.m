@interface _FBSTestExitAction
- (_FBSTestExitAction)init;
- (_FBSTestExitAction)initWithCoder:(id)a3;
- (_FBSTestExitAction)initWithXPCDictionary:(id)a3;
@end

@implementation _FBSTestExitAction

- (_FBSTestExitAction)init
{
  v3 = [off_1E58F44B8 responderWithHandler:&__block_literal_global_22];
  [v3 setQueue:MEMORY[0x1E4F14428]];
  v4 = objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)_FBSTestExitAction;
  v5 = [(_FBSTestExitAction *)&v7 initWithInfo:v4 responder:v3];

  return v5;
}

- (_FBSTestExitAction)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  exit(-9);
}

- (_FBSTestExitAction)initWithCoder:(id)a3
{
  id v3 = a3;
  exit(-9);
}

@end