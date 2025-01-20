@interface HDSOSManager
- (BOOL)isAllowedToMessageSOSContacts;
- (id)sosContactManager;
- (void)setIsAllowedToMessageSOSContacts;
@end

@implementation HDSOSManager

- (BOOL)isAllowedToMessageSOSContacts
{
  id SOSUtilitiesClass_0 = getSOSUtilitiesClass_0();

  return [SOSUtilitiesClass_0 isAllowedToMessageSOSContacts];
}

- (void)setIsAllowedToMessageSOSContacts
{
  id SOSUtilitiesClass_0 = getSOSUtilitiesClass_0();

  [SOSUtilitiesClass_0 setAllowedToMessageSOSContacts:1];
}

- (id)sosContactManager
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getSOSContactsManagerClass_softClass;
  uint64_t v10 = getSOSContactsManagerClass_softClass;
  if (!getSOSContactsManagerClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSOSContactsManagerClass_block_invoke;
    v6[3] = &unk_1E62F6B28;
    v6[4] = &v7;
    __getSOSContactsManagerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);

  return v4;
}

@end