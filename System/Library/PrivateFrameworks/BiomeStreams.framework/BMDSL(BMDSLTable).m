@interface BMDSL(BMDSLTable)
- (BMDSLTableMap)asTableWithTransform:()BMDSLTable schema:;
@end

@implementation BMDSL(BMDSLTable)

- (BMDSLTableMap)asTableWithTransform:()BMDSLTable schema:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BMDSLTableMap alloc] initWithUpstream:a1 transform:v7 schema:v6];

  return v8;
}

@end