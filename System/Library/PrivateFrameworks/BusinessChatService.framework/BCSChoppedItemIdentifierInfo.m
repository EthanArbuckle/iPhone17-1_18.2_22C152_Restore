@interface BCSChoppedItemIdentifierInfo
+ (BCSChoppedItemIdentifierInfo)newWithLinkItemIdentifier:(int64_t)a3 chopID:;
@end

@implementation BCSChoppedItemIdentifierInfo

+ (BCSChoppedItemIdentifierInfo)newWithLinkItemIdentifier:(int64_t)a3 chopID:
{
  id v5 = a2;
  self;
  v6 = objc_alloc_init(BCSChoppedItemIdentifierInfo);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemIdentifier, a2);

    v7->_chopID = a3;
  }
  else
  {
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end