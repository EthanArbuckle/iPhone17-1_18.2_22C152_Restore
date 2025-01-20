@interface CAAnimation(AuthKit)
+ (id)ak_jiggleAnimation;
@end

@implementation CAAnimation(AuthKit)

+ (id)ak_jiggleAnimation
{
  v0 = [MEMORY[0x1E4F39C90] animation];
  [v0 setMass:1.20000005];
  [v0 setStiffness:1200.0];
  [v0 setDamping:12.0];
  [v0 setDuration:1.39999998];
  [v0 setVelocity:0.0];
  [v0 setFillMode:*MEMORY[0x1E4F39F98]];
  LODWORD(v1) = 30.0;
  v2 = [NSNumber numberWithFloat:v1];
  [v0 setFromValue:v2];

  v3 = [NSNumber numberWithFloat:0.0];
  [v0 setToValue:v3];

  v4 = [MEMORY[0x1E4F39D20] functionWithName:*MEMORY[0x1E4F3A600]];
  [v0 setValueFunction:v4];

  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :v6 :v7 :v8];
  [v0 setTimingFunction:v9];

  [v0 setKeyPath:@"transform"];

  return v0;
}

@end