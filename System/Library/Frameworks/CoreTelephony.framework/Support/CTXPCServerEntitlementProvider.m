@interface CTXPCServerEntitlementProvider
- (const)accessControlListForRequest:(SEL)a3;
- (int)requiredEntitlementForNotification:(SEL)a3;
- (int)requiredEntitlementForRequest:(SEL)a3;
@end

@implementation CTXPCServerEntitlementProvider

- (const)accessControlListForRequest:(SEL)a3
{
  uint64_t v3 = qword_101B0D0F8;
  if (!qword_101B0D0F8) {
    return 0;
  }
  v4 = &qword_101B0D0F8;
  do
  {
    unint64_t v5 = *(void *)(v3 + 32);
    BOOL v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3) {
      v7 = (uint64_t *)v3;
    }
    else {
      v7 = (uint64_t *)(v3 + 8);
    }
    if (v6) {
      v4 = (uint64_t *)v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v4 == &qword_101B0D0F8) {
    return 0;
  }
  unint64_t v8 = v4[4];
  v9 = v4 + 5;
  if (v8 <= (unint64_t)a3) {
    return v9;
  }
  else {
    return 0;
  }
}

- (int)requiredEntitlementForRequest:(SEL)a3
{
  uint64_t v3 = qword_101B0D098;
  if (!qword_101B0D098) {
    return 2;
  }
  v4 = &qword_101B0D098;
  do
  {
    unint64_t v5 = *(void *)(v3 + 32);
    BOOL v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3) {
      v7 = (uint64_t *)v3;
    }
    else {
      v7 = (uint64_t *)(v3 + 8);
    }
    if (v6) {
      v4 = (uint64_t *)v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v4 != &qword_101B0D098 && v4[4] <= (unint64_t)a3) {
    return *((_DWORD *)v4 + 10);
  }
  else {
    return 2;
  }
}

- (int)requiredEntitlementForNotification:(SEL)a3
{
  uint64_t v3 = qword_101B0D0B0;
  if (!qword_101B0D0B0) {
    return 2;
  }
  v4 = &qword_101B0D0B0;
  do
  {
    unint64_t v5 = *(void *)(v3 + 32);
    BOOL v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3) {
      v7 = (uint64_t *)v3;
    }
    else {
      v7 = (uint64_t *)(v3 + 8);
    }
    if (v6) {
      v4 = (uint64_t *)v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v4 != &qword_101B0D0B0 && v4[4] <= (unint64_t)a3) {
    return *((_DWORD *)v4 + 10);
  }
  else {
    return 2;
  }
}

@end