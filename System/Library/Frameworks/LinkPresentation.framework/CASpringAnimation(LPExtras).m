@interface CASpringAnimation(LPExtras)
+ (id)_lp_springWithMass:()LPExtras stiffness:damping:;
@end

@implementation CASpringAnimation(LPExtras)

+ (id)_lp_springWithMass:()LPExtras stiffness:damping:
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F39C90]);
  [v6 setMass:a1];
  [v6 setStiffness:a2];
  [v6 setDamping:a3];
  [v6 setFillMode:*MEMORY[0x1E4F39F98]];
  [v6 settlingDuration];
  objc_msgSend(v6, "setDuration:");

  return v6;
}

@end