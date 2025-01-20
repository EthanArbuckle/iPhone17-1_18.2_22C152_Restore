@interface CNContainerConstraintsPathDescription
- (BOOL)isWritable;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)key;
- (int)abPropertyID;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerConstraintsPathDescription

- (id)key
{
  return @"constraintsPath";
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)[a3 constraintsPath];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E00];
}

@end