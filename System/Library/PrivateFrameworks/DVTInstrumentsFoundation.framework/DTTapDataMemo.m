@interface DTTapDataMemo
- (BOOL)finalMemo;
- (BOOL)supportsPeek;
- (void)setFinalMemo:(BOOL)a3;
- (void)setSupportsPeek:(BOOL)a3;
@end

@implementation DTTapDataMemo

- (BOOL)supportsPeek
{
  return *((unsigned char *)&self->super._tapVersion + 4);
}

- (void)setSupportsPeek:(BOOL)a3
{
  *((unsigned char *)&self->super._tapVersion + 4) = a3;
}

- (BOOL)finalMemo
{
  return *((unsigned char *)&self->super._tapVersion + 5);
}

- (void)setFinalMemo:(BOOL)a3
{
  *((unsigned char *)&self->super._tapVersion + 5) = a3;
}

@end