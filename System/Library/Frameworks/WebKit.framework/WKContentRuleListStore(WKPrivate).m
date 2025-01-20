@interface WKContentRuleListStore(WKPrivate)
- (uint64_t)_getContentRuleListSourceForIdentifier:()WKPrivate completionHandler:;
- (void)_getContentRuleListSourceForIdentifier:()WKPrivate completionHandler:;
@end

@implementation WKContentRuleListStore(WKPrivate)

- (void)_getContentRuleListSourceForIdentifier:()WKPrivate completionHandler:
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C2C28;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_getContentRuleListSourceForIdentifier:()WKPrivate completionHandler:
{
  v2 = *a2;
  *a2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  if (v2) {
    uint64_t v4 = WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
    {
      return WTF::StringImpl::destroy(v2, v6);
    }
    else
    {
      *(_DWORD *)v2 -= 2;
    }
  }
  return result;
}

@end