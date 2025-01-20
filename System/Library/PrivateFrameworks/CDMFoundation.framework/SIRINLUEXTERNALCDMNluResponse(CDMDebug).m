@interface SIRINLUEXTERNALCDMNluResponse(CDMDebug)
- (id)debugText;
- (void)setDebugText:()CDMDebug;
@end

@implementation SIRINLUEXTERNALCDMNluResponse(CDMDebug)

- (id)debugText
{
  return objc_getAssociatedObject(a1, sel_setDebugText_);
}

- (void)setDebugText:()CDMDebug
{
}

@end