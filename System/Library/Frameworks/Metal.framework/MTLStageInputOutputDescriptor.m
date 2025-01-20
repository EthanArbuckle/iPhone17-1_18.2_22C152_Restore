@interface MTLStageInputOutputDescriptor
+ (MTLStageInputOutputDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLStageInputOutputDescriptor)stageInputOutputDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
@end

@implementation MTLStageInputOutputDescriptor

+ (MTLStageInputOutputDescriptor)stageInputOutputDescriptor
{
  v2 = objc_alloc_init(MTLStageInputOutputDescriptorInternal);

  return (MTLStageInputOutputDescriptor *)v2;
}

+ (MTLStageInputOutputDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLStageInputOutputDescriptor *)+[MTLStageInputOutputDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLStageInputOutputDescriptor;
    return (MTLStageInputOutputDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  return 0;
}

@end