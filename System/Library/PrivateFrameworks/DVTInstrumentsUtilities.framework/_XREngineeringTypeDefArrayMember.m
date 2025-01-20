@interface _XREngineeringTypeDefArrayMember
- (void)_handleCompletion;
@end

@implementation _XREngineeringTypeDefArrayMember

- (void)_handleCompletion
{
  parent = self->super.super.parent;
  accumulator = self->super.accumulator;
  [MEMORY[0x263F08708] a2 v2 v3 v4];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v11 = [accumulator stringByTrimmingCharactersInSet:v8 options:(NSStringCompareOptions)v19 range:v9];
  v16 = [self elementNameWithName:v12 value:v13 valueType:v14 valueSize:v15];
  [parent addString:v17 elementType:(uint64_t)v11];
}

@end