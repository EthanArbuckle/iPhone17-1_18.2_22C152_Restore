@interface NSURL(CommonBRAdditions)
- (id)br_physicalURL;
@end

@implementation NSURL(CommonBRAdditions)

- (id)br_physicalURL
{
  if (_CFURLIsItemPromiseAtURL())
  {
    id v2 = a1;
  }
  else
  {
    uint64_t v3 = _CFURLPromiseCopyPhysicalURL();
    v4 = (void *)v3;
    if (v3) {
      v5 = (void *)v3;
    }
    else {
      v5 = a1;
    }
    id v2 = v5;
  }

  return v2;
}

@end