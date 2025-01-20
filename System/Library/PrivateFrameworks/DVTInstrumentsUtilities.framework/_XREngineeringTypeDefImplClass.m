@interface _XREngineeringTypeDefImplClass
- (void)_handleCompletion;
@end

@implementation _XREngineeringTypeDefImplClass

- (void)_handleCompletion
{
  accumulator = self->super.accumulator;
  v7 = [MEMORY[0x263F08708] a2 v2 v3 v4];
  [accumulator stringByTrimmingCharactersInSet:v8];
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  if (qword_2687AA198 != -1) {
    dispatch_once(&qword_2687AA198, &unk_26E7526B0);
  }
  v14 = [qword_2687AA190 objectForKeyedSubscript:v11 atIndex:v25 withObject:v12 withObject:v13];
  if (!v14) {
    sub_23459BA9C();
  }
  v19 = v14;
  parent = self->super.super.parent;
  uint64_t v21 = [v14 performSelector:v15 withObject:v16 withObject:v17 withObject:v18];
  [parent setImpl:v22 v21:v21 v23:v23 v24:v24];
}

@end