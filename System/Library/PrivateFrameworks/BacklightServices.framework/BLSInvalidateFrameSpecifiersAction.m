@interface BLSInvalidateFrameSpecifiersAction
- (BLSInvalidateFrameSpecifiersAction)initWithReason:(id)a3;
- (NSString)reason;
@end

@implementation BLSInvalidateFrameSpecifiersAction

- (BLSInvalidateFrameSpecifiersAction)initWithReason:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)BLSInvalidateFrameSpecifiersAction;
  v7 = [(BLSInvalidateFrameSpecifiersAction *)&v9 initWithInfo:v6 responder:0];

  return v7;
}

- (NSString)reason
{
  v2 = [(BLSInvalidateFrameSpecifiersAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

@end