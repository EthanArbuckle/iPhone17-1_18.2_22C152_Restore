@interface AAPSyncPrimitiveAnchor
+ (id)anchorFromIndex:(unint64_t)a3;
- (AAPSyncPrimitiveAnchor)anchorWithSubIndex:(unint64_t)a3;
- (BOOL)isPrimitiveAnchor;
@end

@implementation AAPSyncPrimitiveAnchor

+ (id)anchorFromIndex:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) _initWithMainIndex:a3 subIndex:0];

  return v3;
}

- (AAPSyncPrimitiveAnchor)anchorWithSubIndex:(unint64_t)a3
{
  if (a3)
  {
    id v3 = [[AAPSyncAnchor alloc] _initWithMainIndex:self->super._mainIndex subIndex:a3];
    return (AAPSyncPrimitiveAnchor *)v3;
  }
  else
  {
    return (AAPSyncPrimitiveAnchor *)[(AAPSyncAnchor *)self primitiveAnchor];
  }
}

- (BOOL)isPrimitiveAnchor
{
  return 1;
}

@end