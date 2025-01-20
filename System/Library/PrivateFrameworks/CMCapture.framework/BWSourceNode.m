@interface BWSourceNode
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (OpaqueCMClock)clock;
- (id)nodeType;
@end

@implementation BWSourceNode

- (id)nodeType
{
  return @"Source";
}

- (BOOL)start:(id *)a3
{
  return 1;
}

- (BOOL)stop:(id *)a3
{
  return 1;
}

- (OpaqueCMClock)clock
{
  return 0;
}

@end