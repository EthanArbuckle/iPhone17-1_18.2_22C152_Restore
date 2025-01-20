@interface _AXTableViewInternal
- (_AXTableViewInternal)init;
- (uint64_t)accessibleElementCount;
- (uint64_t)children;
- (uint64_t)indexMap;
- (uint64_t)searchControllerDimmingViewVisible;
- (uint64_t)searchTableViewVisible;
- (uint64_t)sectionFooters;
- (uint64_t)sectionHeaders;
- (uint64_t)setAccessibleElementCount:(uint64_t)result;
- (uint64_t)setReusableCellsEnabled:(uint64_t)result;
- (uint64_t)setSearchControllerDimmingViewVisible:(uint64_t)result;
- (uint64_t)setSearchTableViewVisible:(uint64_t)result;
@end

@implementation _AXTableViewInternal

- (_AXTableViewInternal)init
{
  SEL v12 = a2;
  id v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)_AXTableViewInternal;
  id v13 = [(_AXTableViewInternal *)&v11 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    uint64_t v2 = [objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
    v3 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v2;

    uint64_t v4 = [objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
    v5 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v4;

    uint64_t v6 = [objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
    v7 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v6;

    uint64_t v8 = [objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
    v9 = (void *)*((void *)v13 + 4);
    *((void *)v13 + 4) = v8;

    v14 = (_AXTableViewInternal *)v13;
  }
  else
  {
    v14 = 0;
  }
  objc_storeStrong(&v13, 0);
  return v14;
}

- (uint64_t)searchControllerDimmingViewVisible
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 42) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)setSearchControllerDimmingViewVisible:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 42) = a2 & 1;
  }
  return result;
}

- (uint64_t)searchTableViewVisible
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 41) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)setSearchTableViewVisible:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 41) = a2 & 1;
  }
  return result;
}

- (uint64_t)accessibleElementCount
{
  if (a1) {
    return *(void *)(a1 + 48);
  }
  else {
    return 0;
  }
}

- (uint64_t)setAccessibleElementCount:(uint64_t)result
{
  if (result) {
    *(void *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)children
{
  if (a1) {
    return *(void *)(a1 + 8);
  }
  else {
    return 0;
  }
}

- (uint64_t)indexMap
{
  if (a1) {
    return *(void *)(a1 + 16);
  }
  else {
    return 0;
  }
}

- (uint64_t)setReusableCellsEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 40) = a2 & 1;
  }
  return result;
}

- (uint64_t)sectionHeaders
{
  if (a1) {
    return *(void *)(a1 + 24);
  }
  else {
    return 0;
  }
}

- (uint64_t)sectionFooters
{
  if (a1) {
    return *(void *)(a1 + 32);
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end