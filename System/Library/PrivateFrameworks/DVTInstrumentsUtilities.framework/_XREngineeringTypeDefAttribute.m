@interface _XREngineeringTypeDefAttribute
- (void)_handleCompletion;
@end

@implementation _XREngineeringTypeDefAttribute

- (void)_handleCompletion
{
  accumulator = self->super.accumulator;
  v7 = [MEMORY[0x263F08708] a2 v2 v3 v4];
  [accumulator stringByTrimmingCharactersInSet:v8];
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  if (qword_2687AA188 != -1) {
    dispatch_once(&qword_2687AA188, &unk_26E752570);
  }
  v14 = [qword_2687AA180 objectForKeyedSubscript:v11 atIndex:v25 withObject:v12 withObject:v13];
  if (!v14) {
    sub_23459BA70();
  }
  v19 = v14;
  parent = self->super.super.parent;
  uint64_t v21 = [v14 unsignedIntegerValueForSelector:v15 withObject:v16 withObject:v17 withObject:v18];
  [parent addAttribute:v22 attribute:v21 value:v23 range:v24];
}

@end