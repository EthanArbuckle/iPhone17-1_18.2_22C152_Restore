@interface VCPMADResource
- (id)description;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (void)purge;
@end

@implementation VCPMADResource

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  objc_msgSend(v3, "appendFormat:", @"active cost: %d,", -[VCPMADResource activeCost](self, "activeCost"));
  objc_msgSend(v3, "appendFormat:", @"inactive cost: %d>", -[VCPMADResource inactiveCost](self, "inactiveCost"));
  return v3;
}

- (int64_t)activeCost
{
  return 100;
}

- (int64_t)inactiveCost
{
  return 100;
}

- (void)purge
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1BBEDA000, a2, OS_LOG_TYPE_FAULT, "%@ does not implement purge", (uint8_t *)&v5, 0xCu);
}

@end