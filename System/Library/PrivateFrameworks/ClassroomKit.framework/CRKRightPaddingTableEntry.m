@interface CRKRightPaddingTableEntry
- (CRKRightPaddingTableEntry)initWithObject:(id)a3;
- (id)rawStringValue;
- (id)stringValueWithLength:(unint64_t)a3;
@end

@implementation CRKRightPaddingTableEntry

- (CRKRightPaddingTableEntry)initWithObject:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKRightPaddingTableEntry.m", 20, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CRKRightPaddingTableEntry;
  v7 = [(CRKRightPaddingTableEntry *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong(&v7->mObject, a3);
  }

  return v8;
}

- (id)rawStringValue
{
  return (id)[self->mObject description];
}

- (id)stringValueWithLength:(unint64_t)a3
{
  v4 = [(CRKRightPaddingTableEntry *)self rawStringValue];
  v5 = [v4 stringByPaddingToLength:a3 withString:@" " startingAtIndex:0];

  return v5;
}

- (void).cxx_destruct
{
}

@end