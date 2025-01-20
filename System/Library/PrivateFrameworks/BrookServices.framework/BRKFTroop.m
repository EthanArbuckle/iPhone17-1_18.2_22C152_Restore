@interface BRKFTroop
+ (BOOL)isEnabled;
- (BRKFTroopDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation BRKFTroop

+ (BOOL)isEnabled
{
  return 0;
}

- (BRKFTroopDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BRKFTroopDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end