@interface AEOSGestalt
- (BOOL)isInternalOS;
@end

@implementation AEOSGestalt

- (BOOL)isInternalOS
{
  return MEMORY[0x270EDAB48]("com.apple.assessmentmode", a2);
}

@end