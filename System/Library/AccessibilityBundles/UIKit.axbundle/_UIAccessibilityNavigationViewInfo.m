@interface _UIAccessibilityNavigationViewInfo
- (id)barButtonItem;
- (id)navigationBar;
- (id)navigationItem;
- (id)setBarButtonItem:(id *)result;
- (id)setNavigationBar:(id *)result;
- (id)setNavigationItem:(id *)result;
- (uint64_t)isCancelItem;
- (uint64_t)isRightItem;
- (uint64_t)setIsCancelItem:(uint64_t)result;
- (uint64_t)setIsRightItem:(uint64_t)result;
@end

@implementation _UIAccessibilityNavigationViewInfo

- (id)navigationItem
{
  if (a1) {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)setNavigationItem:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 2, a2);
  }
  return result;
}

- (id)barButtonItem
{
  if (a1) {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)setBarButtonItem:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

- (id)navigationBar
{
  if (a1) {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)setNavigationBar:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 4, a2);
  }
  return result;
}

- (uint64_t)isCancelItem
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 8) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)setIsCancelItem:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2 & 1;
  }
  return result;
}

- (uint64_t)isRightItem
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 9) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)setIsRightItem:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 9) = a2 & 1;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end