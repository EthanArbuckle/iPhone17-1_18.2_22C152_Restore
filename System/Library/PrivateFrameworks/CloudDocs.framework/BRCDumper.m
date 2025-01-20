@interface BRCDumper
- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (id)stringForReset;
- (void)changeAttributes:(int)a3;
- (void)changeBgColor:(int)a3;
- (void)changeFgColor:(int)a3;
- (void)startAttributes:(int)a3;
- (void)startBgColor:(int)a3;
- (void)startBgColor:(int)a3 attr:(int)a4;
- (void)startFgColor:(int)a3;
- (void)startFgColor:(int)a3 attr:(int)a4;
@end

@implementation BRCDumper

- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  return &stru_1EF11DA20;
}

- (id)stringForReset
{
  return &stru_1EF11DA20;
}

- (void)startFgColor:(int)a3 attr:(int)a4
{
}

- (void)startBgColor:(int)a3 attr:(int)a4
{
}

- (void)startFgColor:(int)a3
{
}

- (void)startBgColor:(int)a3
{
}

- (void)startAttributes:(int)a3
{
}

- (void)changeFgColor:(int)a3
{
}

- (void)changeBgColor:(int)a3
{
}

- (void)changeAttributes:(int)a3
{
}

@end