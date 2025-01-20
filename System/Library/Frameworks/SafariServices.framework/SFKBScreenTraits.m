@interface SFKBScreenTraits
+ (id)traitsWithScreen:(id)a3 orientation:(int64_t)a4;
- (BOOL)isKeyboardMinorEdgeWidth;
- (BOOL)sf_isKeyboardMinorEdgeWidth;
- (void)setSf_isKeyboardMinorEdgeWidth:(BOOL)a3;
@end

@implementation SFKBScreenTraits

+ (id)traitsWithScreen:(id)a3 orientation:(int64_t)a4
{
  id v5 = a3;
  if (+[SFKBScreenTraits instancesRespondToSelector:sel_initWithScreen_orientation_allowFloating_ignoreRemoteKeyboard_])
  {
    v6 = [(UIKBScreenTraits *)[SFKBScreenTraits alloc] initWithScreen:v5 orientation:a4 allowFloating:0 ignoreRemoteKeyboard:0];
  }
  else
  {
    v6 = [MEMORY[0x1E4FB18B0] traitsWithScreen:v5 orientation:a4];
  }
  v7 = v6;

  return v7;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  return self->_sf_isKeyboardMinorEdgeWidth;
}

- (BOOL)sf_isKeyboardMinorEdgeWidth
{
  return self->_sf_isKeyboardMinorEdgeWidth;
}

- (void)setSf_isKeyboardMinorEdgeWidth:(BOOL)a3
{
  self->_sf_isKeyboardMinorEdgeWidth = a3;
}

@end