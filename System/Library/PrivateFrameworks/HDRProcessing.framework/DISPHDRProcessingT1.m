@interface DISPHDRProcessingT1
- (BOOL)isContentSupported:(id *)a3;
- (DISPHDRProcessingT1)init;
@end

@implementation DISPHDRProcessingT1

- (DISPHDRProcessingT1)init
{
  v6.receiver = self;
  v6.super_class = (Class)DISPHDRProcessingT1;
  v2 = [(DISPHDRProcessing *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (BOOL)isContentSupported:(id *)a3
{
  return (a3->var0 & 0xFFFFFFFE) == 2;
}

@end