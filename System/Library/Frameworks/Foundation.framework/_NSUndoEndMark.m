@interface _NSUndoEndMark
- (BOOL)isEndMark;
- (id)description;
@end

@implementation _NSUndoEndMark

- (BOOL)isEndMark
{
  return 1;
}

- (id)description
{
  return @"endUndoGrouping";
}

@end